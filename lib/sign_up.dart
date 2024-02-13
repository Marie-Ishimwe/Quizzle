import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/green_btn.dart';
import 'package:quizzle/icon_button.dart';
import 'package:quizzle/nickname.dart';
import 'package:quizzle/orange_btn.dart';
import 'package:quizzle/sign_in.dart';
import 'package:quizzle/start_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final nicknameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool hidden = true;
  bool hide = true;
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
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomFaIconButton(
                        onTap: () {
                          // Navigation logic
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartingScreen()),
                          );
                        },
                        iconData: FontAwesomeIcons.arrowLeft,
                        iconColor: const Color(0xFFFFF9DB),
                        buttonColor: const Color(0xFFF88F1E),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Opacity(
                    opacity: .85,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .70,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xE0EA8827),
                              Color(0xA0F27C07),
                            ],
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
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
                            )
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Text(
                                'Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFFF9DB),
                                  fontSize: 48,
                                  fontFamily: 'SantaChildFont',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2.40,
                                ),
                              ),
                              SizedBox(
                                width: size.width * .8,
                                // height: 30,
                                child: const Text(
                                  'Create your Quizzle account and enjoy this life time of adventure that awaits you!....',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFFFF9DB),
                                    fontSize: 12,
                                    fontFamily: 'StudioFeixenSansTRIAL',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xFFE9E6D1),
                                              offset: Offset(0, 2),
                                              // blurRadius: 4,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      width: size.width * .8,
                                      height: 55,
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        textAlign: TextAlign.center,
                                        controller: nicknameController,
                                        cursorColor: const Color(0xFFF56300),
                                        style: const TextStyle(
                                          color: Color(
                                              0xFFF56300), // Set the text color to orange
                                          fontSize: 16,
                                          fontFamily: 'StudioFeixenSansTRIAL',
                                        ),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFF8F4F8),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          hintText: "Nickname",
                                          hintStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 239, 166, 117),
                                            fontSize: 16,
                                            fontFamily: 'StudioFeixenSansTRIAL',
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a nickname';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    // ************ Password ***************

                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xFFE9E6D1),
                                              offset: Offset(0, 2),
                                              // blurRadius: 4,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      width: size.width * .8,
                                      height: 55,
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        obscureText: hidden,
                                        obscuringCharacter: "*",
                                        textAlign: TextAlign.center,
                                        controller: passwordController,
                                        cursorColor: const Color(0xFFF56300),
                                        style: const TextStyle(
                                          color: Color(
                                              0xFFF56300), // Set the text color to orange
                                          fontSize: 16,
                                          fontFamily: 'StudioFeixenSansTRIAL',
                                        ),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFF8F4F8),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  hidden = !hidden;
                                                },
                                              );
                                            },
                                            icon: hidden
                                                ? const FaIcon(
                                                    FontAwesomeIcons.eyeSlash,
                                                    color: Color.fromARGB(
                                                        255, 239, 166, 117),
                                                    size: 15.0,
                                                  )
                                                : const FaIcon(
                                                    FontAwesomeIcons.eye,
                                                    color: Color.fromARGB(
                                                        255, 239, 166, 117),
                                                    size: 15.0,
                                                  ),
                                          ),
                                          hintText: "Password",
                                          hintStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 239, 166, 117),
                                            fontSize: 16,
                                            fontFamily: 'StudioFeixenSansTRIAL',
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password field can be empty';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),

                                    // ************Confirm Password ***************

                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xFFE9E6D1),
                                              offset: Offset(0, 2),
                                              // blurRadius: 4,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      width: size.width * .8,
                                      height: 55,
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: hide,
                                        obscuringCharacter: "*",
                                        textAlign: TextAlign.center,
                                        controller: confirmPasswordController,
                                        cursorColor: const Color(0xFFF56300),
                                        style: const TextStyle(
                                          color: Color(
                                              0xFFF56300), // Set the text color to orange
                                          fontSize: 16,
                                          fontFamily: 'StudioFeixenSansTRIAL',
                                        ),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFF8F4F8),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  hide = !hide;
                                                },
                                              );
                                            },
                                            icon: hidden
                                                ? const FaIcon(
                                                    FontAwesomeIcons.eyeSlash,
                                                    color: Color.fromARGB(
                                                        255, 239, 166, 117),
                                                    size: 15.0,
                                                  )
                                                : const FaIcon(
                                                    FontAwesomeIcons.eye,
                                                    color: Color.fromARGB(
                                                        255, 239, 166, 117),
                                                    size: 15.0,
                                                  ),
                                          ),
                                          hintText: "Confirm password",
                                          hintStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 239, 166, 117),
                                            fontSize: 16,
                                            fontFamily: 'StudioFeixenSansTRIAL',
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Confirm password field can't be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              CustomOrangeButton(
                                buttonText: "Sign up",
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NicknameScreen()));
                                },
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                width: size.width * .8,
                                child: const Text(
                                  'Already a member?',
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
                                height: 10.0,
                              ),
                              CustomGreenButton(
                                buttonText: 'Sign in',
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignIn()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
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
        ),
      ),
    );
  }
}
