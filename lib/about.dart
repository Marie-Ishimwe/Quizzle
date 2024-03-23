import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/icon_button.dart';
import 'package:quizzle/smaller_icon_button.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Color.fromARGB(51, 0, 0, 56),
                Colors.black.withOpacity(0.6)
              ],
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 85,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 6),
                        blurRadius: 4),
                    BoxShadow(
                      color: Color.fromRGBO(234, 128, 14, 1),
                      offset: Offset(0, -3),
                      spreadRadius: -1,
                    ),
                  ],
                  color: Color.fromRGBO(248, 143, 30, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      const Text(
                        'About Quizzle',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(248, 244, 248, 1),
                            fontFamily: 'StudioFeixenSansTRIAL',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.40,
                            height: 1.2),
                      ),
                      SmallerFaIconButton(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Playground()));
                        },
                        iconData: FontAwesomeIcons.house,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: double.infinity,
                  height: 90,
                  decoration: const BoxDecoration(
                    // color: Colors.black,
                    gradient: LinearGradient(
                      begin: Alignment(-1, 6.123234262925839e-17),
                      end: Alignment(6.123234262925839e-17, 1),
                      colors: [
                        Color.fromRGBO(247, 127, 8, 0.7),
                        Color.fromRGBO(247, 127, 8, 0.7)
                      ],
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal, // Make the list scroll horizontally
                    itemCount: 5, // Number of buttons you want to display
                    itemBuilder: (_, index) {
                      // Define the actions for each button
                      final Map<int, IconData> actions = {
                        0: FontAwesomeIcons.userSecret, // Logout
                        1: FontAwesomeIcons.penToSquare, // Edit Profile
                        2: FontAwesomeIcons.user, // User Profile
                        3: FontAwesomeIcons.gear, // Settings
                        4: FontAwesomeIcons.question, // Help
                      };

                      // Define the descriptions for each button
                      final Map<int, String> descriptions = {
                        0: "Privacy Policy",
                        1: "Edit Profile",
                        2: "User Profile",
                        3: "Settings",
                        4: "Help",
                      };

                      // Define the onTap actions for each button
                      final Map<int, VoidCallback> onTapActions = {
                        0: () {
                          // Logout action
                          print("Logout button pressed");
                        },
                        1: () {
                          // Edit Profile action
                          print("Edit Profile button pressed");
                        },
                        2: () {
                          // User Profile action
                          print("User Profile button pressed");
                        },
                        3: () {
                          // Settings action
                          print("Settings button pressed");
                        },
                        4: () {
                          // Help action
                          print("Help button pressed");
                        },
                      };

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                8.0), // Add horizontal padding around each item
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomFaIconButton(
                              onTap: onTapActions[index]!,
                              iconData: actions[index]!,
                            ),
                            const SizedBox(
                                height:
                                    8), // Add some space between the button and the text
                            Text(
                              descriptions[index]!,
                              style: const TextStyle(
                                fontFamily: 'StudioFeixenSansTRIAL',
                                fontSize: 14,
                                letterSpacing: 0.1,
                                color: Color(0xFFFFF9DB),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
