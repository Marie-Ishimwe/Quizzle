import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'auth_exception.dart';

class AuthenticationRepository extends GetxController {
  // Singleton instance of the class
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sign up with email and password
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // Wait for the result of createUserWithEmailAndPassword
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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
}
