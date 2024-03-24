import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzle/green_btn.dart';
import 'package:quizzle/icon_button.dart';
import 'package:quizzle/orange_btn.dart';
import 'package:quizzle/sign_up.dart';
import 'authentication/controllers/login/login_controller.dart';
import 'utils/validators/validation.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final controller = Get.put(LoginController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/final_bg.png"),
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
                                builder: (context) => const SignUp()),
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
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .75,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-1, 6.123234262925839e-17),
                          end: Alignment(6.123234262925839e-17, 1),
                          colors: [
                            Color.fromRGBO(247, 127, 8, 0.7),
                            Color.fromRGBO(247, 127, 8, 0.7)
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Sign in',
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
                              child: const Text(
                                'Hi there! Welcome back to Quizzle. It is a pleasure to have you back....',
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
                            Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: size.width * .8,
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      textAlign: TextAlign.center,
                                      controller: controller.emailController,
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
                                        hintText: "Email",
                                        hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 239, 166, 117),
                                          fontSize: 16,
                                          fontFamily: 'StudioFeixenSansTRIAL',
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        errorStyle: const TextStyle(
                                          // Customize the style of the error message
                                          color: Color(
                                              0xFFF8F4F8), // Change the color of the error message
                                          fontSize: 14,
                                          fontFamily: 'StudioFeixenSansTRIAL',
                                        ),
                                      ),
                                      validator: (value) =>
                                          Validators.validateEmail(value),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  // ************ Password ***************

                                  SizedBox(
                                    width: size.width * .8,
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      obscureText: hidden,
                                      obscuringCharacter: "*",
                                      textAlign: TextAlign.center,
                                      controller: controller.passwordController,
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
                                        errorStyle: const TextStyle(
                                          // Customize the style of the error message
                                          color: Color(
                                              0xFFF8F4F8), // Change the color of the error message
                                          fontSize: 14,
                                          fontFamily: 'StudioFeixenSansTRIAL',
                                        ),
                                      ),
                                      validator: (value) =>
                                          Validators.validateEmptyText(
                                              'Password', value),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: size.width * .55,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      color: Color(0xFFFFF9DB),
                                      fontSize: 14,
                                      fontFamily: 'StudioFeixenSansTRIAL',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomOrangeButton(
                              buttonText: "Sign in",
                              onPressed: () {
                                controller.signin(context);
                              },
                              buttonWidth:
                                  MediaQuery.of(context).size.width * 0.7,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              width: size.width * .8,
                              child: const Text(
                                'Don\'t have an accout?',
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
                              height: 5.0,
                            ),
                            CustomGreenButton(
                              buttonText: 'Sign up',
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                            ),
                          ],
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
