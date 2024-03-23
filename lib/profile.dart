import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication_repository.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/icon_button.dart';
import 'package:quizzle/models/user.dart';
import 'package:quizzle/smaller_icon_button.dart';
import 'package:quizzle/start_screen.dart';
import 'package:quizzle/statistics.dart';
import 'package:quizzle/user_repository.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;
  final UserRepository userRepository = UserRepository();

  ProfilePage({super.key, required this.user});

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
                const Color.fromRGBO(
                    0, 0, 0, 150), // Reduced opacity from 51 to 40
                Colors.black.withOpacity(0.8)
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
                        'Profile',
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
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal, // Make the list scroll horizontally
                    itemCount: 5, // Number of buttons you want to display
                    itemBuilder: (_, index) {
                      // Define the actions for each button
                      final Map<int, IconData> actions = {
                        0: FontAwesomeIcons.rightFromBracket, // Logout
                        1: FontAwesomeIcons.penToSquare, // Edit Profile
                        2: FontAwesomeIcons.trash, // Delete account
                        3: FontAwesomeIcons.gear, // Settings
                        4: FontAwesomeIcons.question, // Help
                      };

                      // Define the descriptions for each button
                      final Map<int, String> descriptions = {
                        0: "Logout",
                        1: "Edit Profile",
                        2: "Delete Account",
                        3: "Settings",
                        4: "Help",
                      };

                      // Define the onTap actions for each button
                      final Map<int, VoidCallback> onTapActions = {
                        0: () {
                          // Logout action
                          print("Logout successful");
                          AuthenticationRepository.instance.logout();
                        },
                        1: () {
                          // Edit Profile action
                          print("Edit Profile button pressed");
                        },
                        2: () {
                          // Delete account action
                          userRepository.deleteUserDocument(user.id).then((_) {
                            print("Account deleted successfully");
                            // Navigate to the StartingScreen or LoginScreen after deletion
                            Get.off(() => const StartingScreen());
                          }).catchError((e) {
                            print("Error deleting account: $e");
                            // Optionally, show an error message to the user
                          });
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFAEACA),
                              border: Border.all(
                                width: 7,
                                color: const Color(0xFFDE8627),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile.png',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Hello!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0A040A),
                                  fontSize: 30,
                                  fontFamily: 'StudioFeixenSansTRIAL',
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                user.nickname.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF0A040A),
                                  fontSize: 18,
                                  fontFamily: 'StudioFeixenSansTRIAL',
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                user.email.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF0A040A),
                                  fontSize: 18,
                                  fontFamily: 'StudioFeixenSansTRIAL',
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 5),
                      const Text(
                        "General statistics",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFF8F4F8),
                          fontSize: 30,
                          fontFamily: 'StudioFeixenSansTRIAL',
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const StatisticsContainer(
                        imagePath: 'assets/images/heart.png',
                        imageWidth: 40,
                        imageHeight: 35,
                        message: "Lives",
                        number: "25",
                      ),
                      const SizedBox(height: 10),
                      StatisticsContainer(
                        imagePath: 'assets/images/star.png',
                        imageWidth: 41,
                        imageHeight: 40,
                        message: "First try wins",
                        number: user.wins.toString(),
                      ),
                      const SizedBox(height: 10),
                      StatisticsContainer(
                        imagePath: 'assets/images/coins.png',
                        imageWidth: 40,
                        imageHeight: 39,
                        message: "Coins",
                        number: user.coins.toString(),
                      ),
                      const SizedBox(height: 10),
                      StatisticsContainer(
                        imagePath: 'assets/images/bulb.png',
                        imageWidth: 27,
                        imageHeight: 40,
                        message: "Hints used",
                        number: user.hints.toString(),
                      ),
                    ],
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
