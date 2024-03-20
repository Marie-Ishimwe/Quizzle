import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/models/user.dart';
import 'package:quizzle/statistics.dart';

import 'min_icon_button.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF88F1E),
          borderRadius: BorderRadius.circular(30),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 221, 129, 37),
              offset: Offset(0, 3),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 238, 147, 56),
              offset: Offset(0, -3),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    "Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF8F4F8),
                      fontSize: 30,
                      fontFamily: 'StudioFeixenSansTRIAL',
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0,
                    ),
                  ),
                  MinFaIconButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    iconData: FontAwesomeIcons.xmark,
                    iconColor: const Color(0xFFFFF9DB),
                    buttonColor: const Color(0xFFF88F1E),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFFFAEACA),
                    border: Border.all(
                      width: 10,
                      color: const Color(0xFFDE8627),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ClipOval(
                        child: Image.asset(
                          'images/profile.png',
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
            const SizedBox(height: 10),
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
              imagePath: 'images/heart.png',
              imageWidth: 40,
              imageHeight: 35,
              message: "Lives",
              number: "25",
            ),
            const SizedBox(height: 10),
            StatisticsContainer(
              imagePath: 'images/star.png',
              imageWidth: 41,
              imageHeight: 40,
              message: "First try wins",
              number: user.wins.toString(),
            ),
            const SizedBox(height: 10),
            StatisticsContainer(
              imagePath: 'images/coins.png',
              imageWidth: 40,
              imageHeight: 39,
              message: "Coins",
              number: user.coins.toString(),
            ),
            const SizedBox(height: 10),
            StatisticsContainer(
              imagePath: 'images/bulb.png',
              imageWidth: 27,
              imageHeight: 40,
              message: "Hints used",
              number: user.hints.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
