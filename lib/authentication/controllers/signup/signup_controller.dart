// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication_repository.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/snackbar.dart';
import 'package:quizzle/user_repository.dart';

import '../../../models/user.dart';

class SignUpController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static SignUpController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final nicknameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Boolean flag to indicate whether loading is in progress
  var isLoading = false.obs;

  ///--SIGNUP
  void signup(BuildContext context) async {
    try {
      // Set isLoading to true to show the loading page
      isLoading(true);

      // Check Internet connectivity
      // Form validation
      if (formKey.currentState!.validate()) {
        // If form is validated, perform signup logic
        // Registering user in Firebase Authentication & Saving data in Firebase
        final userCredential = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(
                emailController.text.trim(), passwordController.text.trim());

        // Save Authenticated users in Firestore
        final newUser = UserModel(
            id: userCredential.user!.uid,
            email: emailController.text.trim(),
            nickname: nicknameController.text.trim());
        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        // Show success message
        showCustomSnackBar(
          context,
          Colors.green,
          FontAwesomeIcons.circleCheck,
          'Congratulations!',
          'Your account has been created! Verify your email to continue',
        );
        emailController.clear();
        nicknameController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        // Navigate to Playground screen after successful account creation
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Playground()),
        );
      }
    } on FirebaseAuthException catch (e) {
      showCustomSnackBar(
        context,
        const Color(0xFFF88F1E),
        FontAwesomeIcons.triangleExclamation,
        'Oh snap!',
        e.toString(),
      );
      emailController.clear();
      nicknameController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    } catch (e) {
      // Handle exceptions
      showCustomSnackBar(
        context,
        Colors.red,
        FontAwesomeIcons.triangleExclamation,
        'Oh snap!',
        e.toString(),
      );
    } finally {
      // Set isLoading to false to hide the loading page
      isLoading(false);
    }
  }
}
