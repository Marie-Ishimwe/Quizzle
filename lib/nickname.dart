import 'package:flutter/material.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/orange_btn.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  final formKey = GlobalKey<FormState>();
  final nicknameController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/nickname_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Opacity(
              opacity: .85,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.height) * 0.4,
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 55,
                              child: Text(
                                'Nickname',
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
                            const Text(
                              'How would you want us to call you? ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFFF9DB),
                                fontSize: 14,
                                fontFamily: 'StudioFeixenSansTRIAL',
                                fontWeight: FontWeight.w400,
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
                                  CustomOrangeButton(
                                    buttonText: "Get started",
                                    buttonWidth:
                                        MediaQuery.of(context).size.width * 0.7,
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Playground()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
