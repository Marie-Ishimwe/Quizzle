import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/game_specials/lives.dart';
import 'package:quizzle/common_nouns/animal.dart';
import 'package:quizzle/game_specials/coins.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/common_nouns/family.dart';
import 'package:quizzle/common_nouns/general.dart';
import 'package:quizzle/smaller_icon_button.dart';
import 'package:quizzle/game_specials/wins.dart';
import 'package:quizzle/common_nouns/professions.dart';
import 'package:quizzle/common_nouns/time.dart';
import 'package:quizzle/common_nouns/vehicle.dart';

class Arena extends StatefulWidget {
  const Arena({super.key});

  @override
  State<Arena> createState() => _ArenaState();
}

class _ArenaState extends State<Arena> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(80), // Set the total height of the AppBar
        child: Container(
          margin: const EdgeInsets.only(
            left: 2,
          ),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SmallerFaIconButton(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Playground()));
                    },
                    iconData: FontAwesomeIcons.user,
                  ),
                ),
                const Lives(),
                const Wins(),
                // *********coins
                const Coins(),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/final_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0x33523445),
                Colors.black.withOpacity(0.8999999761581421),
              ],
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: const [
                General(),
                Professions(),
                Animals(),
                Family(),
                Vehicles(),
                TimeWidget(),
                Family(),
                Vehicles(),
                TimeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
