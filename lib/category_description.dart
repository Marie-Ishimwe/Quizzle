import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/difficulty_page.dart';
import 'package:quizzle/green_btn.dart';
import 'package:quizzle/green_smaller_icon.dart';
import 'dashboard.dart';

class CategoryDescription extends StatelessWidget {
  const CategoryDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/general.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0x33523445),
                  Colors.black.withOpacity(0.7999999761581421)
                ],
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SmallerGreenIconButton(
                        onTap: () {
                          // Navigation logic
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Playground(),
                            ),
                          );
                        },
                        iconData: FontAwesomeIcons.arrowLeft,
                        iconColor: const Color(0xFFFFF9DB),
                        buttonColor: const Color(0xFF4D6932),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:
                      screenHeight * 0.45, // Set height to 2% of screen height
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'General',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFFFFF9DB),
                          fontFamily: 'SantaChildFont',
                          fontSize: 48,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 0.75,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'This category challenges your knowledge of all kinds of nouns, ranging from people to places, things, and ideas. You never know what you will get in this category. Be prepared for some surprises and some fun!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFFFFF9DB),
                          fontFamily: 'StudioFeixenSansTRIAL',
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: CustomGreenButton(
                          buttonText: 'Play',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Difficultiness(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
