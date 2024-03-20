import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/start_screen.dart';
import 'package:quizzle/verify_email.dart';

import 'auth_exception.dart';

class AuthenticationRepository extends GetxController {
  // Singleton instance of the class
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  final ValueNotifier<String> currentScreen =
      ValueNotifier<String>('LoadingPage');

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    print("screenRedirect started.");
    final User? user = _auth.currentUser;
    print("Current user: ${user?.email}");

    if (user != null) {
      print("User is authenticated.");
      if (user.emailVerified) {
        print("Email is verified. Navigating to Playground.");
        Get.offAll(() => const Playground());
      } else {
        print("Email is not verified. Navigating to VerifyEmailScreen.");
        Get.offAll(() => const VerifyEmailScreen());
      }
    } else {
      print("User is not authenticated. Navigating to StartingScreen.");
      Get.to(() => const StartingScreen());
    }
  }

//LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      // Attempt to sign in the user with the provided email and password
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Check if the user's email is verified
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthExceptions
      switch (e.code) {
        case 'user-not-found':
          throw AuthException('No user found with this email.');
        case 'wrong-password':
          throw AuthException('Incorrect password.');
        case 'invalid-email':
          throw AuthException('Please provide a valid email address.');
        default:
          throw AuthException('Error signing in user: ${e.message}');
      }
    } catch (e) {
      // Catch any other unexpected exceptions
      throw AuthException('Unexpected error occurred: $e');
    }
  }

  /// Sign up with email and password
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // Wait for the result of createUserWithEmailAndPassword
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Send email verification after successful registration
      await sendEmailVerification();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthExceptions
      switch (e.code) {
        case 'email-already-in-use':
          throw AuthException('The email address $email is already in use.');
        case 'weak-password':
          throw AuthException('The password provided is too weak.');
        case 'invalid-email':
          throw AuthException('Please provide a valid email address.');
        default:
          throw AuthException('Error registering user: ${e.message}');
      }
    } catch (e) {
      // Catch any other unexpected exceptions
      throw AuthException('Unexpected error occurred: $e');
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      // Wait for the result of currentUser.sendEmailVerification
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthExceptions
      switch (e.code) {
        case 'user-not-found':
          throw AuthException('No user found for that email.');
        case 'user-disabled':
          throw AuthException('The user account has been disabled.');
        case 'too-many-requests':
          throw AuthException('Too many requests. Please try again later.');
        case 'email-already-in-use':
          throw AuthException('The email address is already in use.');
        case 'weak-password':
          throw AuthException('The password provided is too weak.');
        case 'invalid-email':
          throw AuthException('Please provide a valid email address.');
        default:
          throw AuthException('Error sending email verification: ${e.message}');
      }
    } on FirebaseException catch (e) {
      // Handle specific FirebaseExceptions
      throw AuthException('Firebase error occurred: ${e.message}');
    } catch (e) {
      // Catch any other unexpected exceptions
      throw AuthException('Unexpected error occurred: $e');
    }
  }

  Future<void> logout() async {
    try {
      // Wait for the result of currentUser.sendEmailVerification
      await FirebaseAuth.instance.signOut();
      Get.off(() => const StartingScreen());
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthExceptions
      switch (e.code) {
        case 'user-not-found':
          throw AuthException('No user found for that email.');
        case 'user-disabled':
          throw AuthException('The user account has been disabled.');
        case 'too-many-requests':
          throw AuthException('Too many requests. Please try again later.');
        case 'email-already-in-use':
          throw AuthException('The email address is already in use.');
        case 'weak-password':
          throw AuthException('The password provided is too weak.');
        case 'invalid-email':
          throw AuthException('Please provide a valid email address.');
        default:
          throw AuthException('Error sending email verification: ${e.message}');
      }
    } on FirebaseException catch (e) {
      // Handle specific FirebaseExceptions
      throw AuthException('Firebase error occurred: ${e.message}');
    } catch (e) {
      // Catch any other unexpected exceptions
      throw AuthException('Unexpected error occurred: $e');
    }
  }
}
