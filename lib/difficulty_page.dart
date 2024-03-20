import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/category_description.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/easy_page.dart';
import 'package:quizzle/sign_up.dart';
import 'package:quizzle/smaller_icon_button.dart';
import 'package:quizzle/medium_page.dart';
import 'package:quizzle/tough_page.dart';
import 'package:quizzle/tricky_page.dart';
import 'easy_btn.dart';
import 'medium_btn.dart';
import 'models/user.dart';
import 'tough_btn.dart';
import 'tricky_btn.dart';
import 'dialog.dart';
import 'user_repository.dart';

class Difficultiness extends StatelessWidget {
  const Difficultiness({super.key});

  Future<UserModel?> _fetchUserDetails() async {
    return await UserRepository.instance.fetchUserDetails();
  }

  void _showPremiumRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDialog(
          image: const AssetImage('images/coins.png'),
          title: "Subscribe",
          message:
              "This feature is only available to premium users.\n Upgrade your plan to keep your learning boundaryless!",
          imageWidth: 120, // Example width
          imageHeight: 107,
          actionText: "Learn more",
          onActionPressed: () {
            // Define your action here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignUp()),
            );
          },
          showCustomRow: true,
          customText: "Unavailable",
          closeIcon: FontAwesomeIcons.xmark, // Specify the close icon
          onClosePressed: (BuildContext context) {
            Navigator.pop(context); // Close the dialog
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel?>(
        future: _fetchUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _buildDifficultySelection(context, snapshot.data);
          }
        },
      ),
    );
  }

  Widget _buildDifficultySelection(BuildContext context, UserModel? user) {
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
                Colors.black.withOpacity(0.6999999761581421)
              ],
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      SmallerFaIconButton(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoryDescription()));
                        },
                        iconData: FontAwesomeIcons.arrowLeft,
                      ),
                      const Text(
                        'Difficulty',
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
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ListView(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          CustomEasyButton(
                              buttonText: 'Easy',
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EasyLevel()));
                              }),
                          CustomMediumButton(
                              buttonText: 'Medium',
                              onTap: () {
                                if (user?.accountType == 'premium') {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MediumLevel()));
                                } else {
                                  _showPremiumRequiredDialog(context);
                                }
                              }),
                          CustomTrickyButton(
                              buttonText: 'Tricky',
                              onTap: () {
                                if (user?.accountType == 'premium') {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TrickyLevel()));
                                } else {
                                  _showPremiumRequiredDialog(context);
                                }
                              }),
                          CustomToughButton(
                              buttonText: 'Tough',
                              onTap: () {
                                if (user?.accountType == 'premium') {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ToughLevel()));
                                } else {
                                  _showPremiumRequiredDialog(context);
                                }
                              }),
                        ],
                      ),
                    ]),
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
