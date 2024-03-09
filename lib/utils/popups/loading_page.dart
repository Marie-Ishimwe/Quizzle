import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication/controllers/signup/signup_controller.dart';

// import '../../authentication_repository.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    super.key,
  });

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFFF88F1E),
        body: Center(
          child: Visibility(
            visible: Get.find<SignUpController>().isLoading.value,
            child: const SpinKitCircle(
              color: Color.fromRGBO(248, 244, 248, 1),
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
