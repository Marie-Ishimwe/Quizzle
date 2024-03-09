import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication/controllers/signup/verify_email_controller.dart';
import 'package:quizzle/authentication_repository.dart';
import 'package:quizzle/green_btn.dart';
import 'package:quizzle/icon_button.dart';
import 'package:quizzle/orange_btn.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomFaIconButton(
                      onTap: () => AuthenticationRepository.instance.logout(),
                      iconData: FontAwesomeIcons.xmark,
                      iconColor: const Color(0xFFFFF9DB),
                      buttonColor: const Color(0xFFF88F1E),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .45,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(-1, 6.123234262925839e-17),
                        end: Alignment(6.123234262925839e-17, 1),
                        colors: [
                          Color.fromRGBO(242, 124, 7, 0.6299999952316284),
                          Color.fromRGBO(234, 136, 39, 0.8799999952316284)
                        ]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFD98531),
                        blurRadius: 0,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0xFFFC9B3C),
                        blurRadius: 0,
                        offset: Offset(0, -4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60,
                            child: Text(
                              'One more step',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFFF9DB),
                                fontSize: 48,
                                fontFamily: 'SantaChildFont',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2.40,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .85,
                            child: const Text(
                              'Almost there! What is remaining is to verify your Email to unlock all the fun that awaits you on the other end!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFFF9DB),
                                fontSize: 14,
                                fontFamily: 'StudioFeixenSansTRIAL',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomOrangeButton(
                            buttonText: "Verify email",
                            onPressed: () => controller
                                .checkEmailVerificationStatus(context),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomGreenButton(
                            buttonText: 'Resend email',
                            onTap: () =>
                                controller.sendEmailVerification(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
