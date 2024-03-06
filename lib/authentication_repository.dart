import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'auth_exception.dart';

class AuthenticationRepository extends GetxController {
  // Static instance of the class
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// [Email & Password] - Sign-in
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // Use await to wait for the result of createUserWithEmailAndPassword
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthExceptions
      switch (e.code) {
        case 'email-already-in-use':
          throw AuthException('The email address is already in use.');
        case 'weak-password':
          throw AuthException('The password provided is too weak.');
        default:
          throw AuthException('Error registering user: ${e.message}');
      }
    } catch (e) {
      // Catch any other unexpected exceptions
      throw AuthException('Unexpected error occurred: $e');
    }
  }
}
