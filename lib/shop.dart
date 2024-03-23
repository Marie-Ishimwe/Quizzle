import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/game_specials/coins.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/heart_card.dart';
import 'package:quizzle/hint_dart.dart';
import 'package:quizzle/models/user.dart';
import 'package:quizzle/user_repository.dart';
import 'smaller_icon_button.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
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
                const Color(0x33523445),
                Colors.black.withOpacity(0.6999999761581421)
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
                      offset: Offset(0, -6),
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
                      FutureBuilder<UserModel>(
                        future: UserRepository.instance.fetchUserDetails(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            // Update userCoins with the fetched coins value
                            return Coins(
                                coinValue:
                                    snapshot.data?.coins.toString() ?? '0');
                          } else {
                            return const Coins(
                                coinValue: '0'); // Show 0 while loading
                          }
                        },
                      ),
                      const Text(
                        'Shop',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(248, 244, 248, 1),
                            fontFamily: 'StudioFeixenSansTRIAL',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.40,
                            height: 1.2),
                      ),
                      const SizedBox(
                        width: 2,
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                    left: 30.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: GridView(
                          // shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                          children: [
                            HeartCard(
                              onPurchase: () {},
                              heartsToAdd: 2,
                              cost: 1000,
                            ),
                            const HintCard(),
                          ]),
                    ),
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
