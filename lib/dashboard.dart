import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/about.dart';
import 'package:quizzle/arena.dart';
import 'package:quizzle/bottom_navigation_icons.dart';
import 'package:quizzle/daily_special.dart';
import 'package:quizzle/shop.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  int currentIndex = 0;
  final pages = [
    const Arena(),
    const DailySpecialPage(),
    const Shop(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          pages[currentIndex],
          if (currentIndex == 0)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: NavigationBarTheme(
                data: const NavigationBarThemeData(
                  labelTextStyle: MaterialStatePropertyAll(
                    TextStyle(
                      fontFamily: 'StudioFeixenSansTRIAL',
                      fontSize: 14,
                      letterSpacing: 0.1,
                      color: Color(0xFFFFF9DB),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  indicatorColor: Colors.transparent,
                ),
                child: NavigationBar(
                  // backgroundColor: Colors.transparent,
                  backgroundColor: const Color(0xFFF88F1E),
                  // labelBehavior:
                  //     NavigationDestinationLabelBehavior.onlyShowSelected,
                  selectedIndex: currentIndex,
                  animationDuration: const Duration(seconds: 2),
                  onDestinationSelected: (index) =>
                      setState(() => currentIndex = index),
                  destinations: const [
                    NavigationDestination(
                      icon: BottomNavigationIcon(
                        iconData: FontAwesomeIcons.house,
                      ),
                      label: 'Playground',
                    ),
                    NavigationDestination(
                      icon: BottomNavigationIcon(
                        iconData: FontAwesomeIcons.gift,
                      ),
                      label: 'Daily special',
                    ),
                    NavigationDestination(
                      icon: BottomNavigationIcon(
                        iconData: FontAwesomeIcons.bagShopping,
                      ),
                      label: 'Shop',
                    ),
                    IgnorePointer(
                      child: NavigationDestination(
                        icon: BottomNavigationIcon(
                          iconData: FontAwesomeIcons.info,
                        ),
                        label: 'About',
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
