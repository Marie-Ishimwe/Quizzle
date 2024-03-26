import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication_repository.dart';
import '../../../snackbar.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  Timer? _autoRedirectTimer;

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  @override
  void onClose() {
    _autoRedirectTimer?.cancel();
    super.onClose();
  }

  // Send Email Verification Link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      showCustomSnackBar(
        Colors.green,
        FontAwesomeIcons.circleCheck,
        'Email sent!',
        'Please check your inbox and verify your email',
      );
    } catch (e) {
      showCustomSnackBar(
        Colors.red,
        FontAwesomeIcons.triangleExclamation,
        'Oh snap!',
        'An error occurred. Please try again.', // Improved error message
      );
    }
  }

  // Timer to Auto Redirect once an Email is verified
  void setTimerForAutoRedirect() {
    _autoRedirectTimer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          // Get.off(() => const Playground());
          Get.off(
            () => AuthenticationRepository.instance.screenRedirect(),
          );
        }
      },
    );
  }

  ///Manually Checking if Email is verified
  void checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      // Get.off(() => const Playground());
      Get.off(
        () => AuthenticationRepository.instance.screenRedirect(),
      );
    } else {
      showCustomSnackBar(
        Colors.red,
        FontAwesomeIcons.triangleExclamation,
        'Email not verified',
        'Please verify your email to proceed',
      );
    }
  }
}
