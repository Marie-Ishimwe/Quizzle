// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication_repository.dart';
import 'package:quizzle/snackbar.dart';

class LoginController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static LoginController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  ///--SIGNUP
  void signin(BuildContext context) async {
    try {
      // Set isLoading to true to show the loading page

      // Check Internet connectivity
      // Form validation

      if (formKey.currentState!.validate()) {
        // If form is validated, perform signup logic
        // Registering user in Firebase Authentication & Saving data in Firebase
        await AuthenticationRepository.instance.loginWithEmailAndPassword(
            emailController.text.trim(), passwordController.text.trim());

        emailController.clear();
        passwordController.clear();

        AuthenticationRepository.instance.screenRedirect();
      }
    } on FirebaseAuthException catch (e) {
      showCustomSnackBar(
        const Color(0xFFF88F1E),
        FontAwesomeIcons.triangleExclamation,
        'Oh snap!',
        e.toString(),
      );
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      // Handle exceptions
      showCustomSnackBar(
        Colors.red,
        FontAwesomeIcons.triangleExclamation,
        'Oh snap!',
        e.toString(),
      );
    }
  }
}
