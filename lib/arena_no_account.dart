import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/game_specials/lives.dart';
import 'package:quizzle/common_nouns/animal.dart';
import 'package:quizzle/game_specials/coins.dart';
import 'package:quizzle/common_nouns/family.dart';
import 'package:quizzle/common_nouns/general.dart';
import 'package:quizzle/sign_up.dart';
import 'package:quizzle/smaller_icon_button.dart';
import 'package:quizzle/game_specials/wins.dart';
import 'package:quizzle/common_nouns/professions.dart';
import 'package:quizzle/common_nouns/time.dart';
import 'package:quizzle/common_nouns/vehicle.dart';

import 'dialog.dart';

class AccountlessArena extends StatefulWidget {
  const AccountlessArena({super.key});

  @override
  State<AccountlessArena> createState() => _AccountlessArenaState();
}

class _AccountlessArenaState extends State<AccountlessArena> {
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
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            image:
                                const AssetImage('assets/images/attention.png'),
                            title: "Inaccessible",
                            message:
                                "This feature is only accessible to registered users. To unlock profile, create an account today!",
                            imageWidth: 120, // Example width
                            imageHeight: 107,
                            actionText: "Sign up",
                            onActionPressed: () {
                              // Define your action here
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
                              );
                            },
                            showCustomRow: true,
                            customText: "Profile",
                            closeIcon: FontAwesomeIcons
                                .xmark, // Specify the close icon
                            onClosePressed: (BuildContext context) {
                              Navigator.pop(context); // Close the dialog
                            },
                          );
                        },
                      );
                    },
                    iconData: FontAwesomeIcons.user,
                  ),
                ),
                const Lives(livesValues: '25'),
                const Wins(winsValue: '10'),
                // *********coins
                const Coins(coinValue: '50000'),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/final_bg.png"),
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
