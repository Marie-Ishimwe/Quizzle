import 'package:flutter/material.dart';
import 'package:quizzle/green_btn.dart';
import 'package:quizzle/nickname.dart';
import 'package:quizzle/orange_btn.dart';
import 'package:quizzle/sign_up.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/final_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                const Color(0x33523445),
                Colors.black.withOpacity(0.8999999761581421)
              ],
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
            )),
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      width: size.width * .6,
                      height: 200,
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    CustomOrangeButton(
                      buttonText: "Play",
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NicknameScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomGreenButton(
                      buttonText: 'Save your progress',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
