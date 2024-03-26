import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzle/dialog.dart';
import 'package:quizzle/game_specials/coins.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/heart_card.dart';
import 'package:quizzle/hint_dart.dart';
import 'package:quizzle/models/user.dart';
import 'package:quizzle/user_repository.dart';
import 'authentication_repository.dart';
import 'models/user_data.dart';
import 'smaller_icon_button.dart';
import 'snackbar.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  late Box<UserData> box;
  UserData? userData;

  @override
  void initState() {
    super.initState();
    box = Hive.box<UserData>('userDataBox');
    userData = box.get('userData');
    if (userData == null) {
      userData = UserData();
      box.put('userData', userData!);
    }
  }

  Future<void> makePurchase(int cost) async {
    if (userData!.coins >= cost) {
      userData!.coins -= cost;
      box.put('userData', userData!);

      // Optionally, update Firebase if the user has an account
      if (AuthenticationRepository.instance.authUser?.uid != null) {
        try {
          // Fetch the user's current coin count
          DocumentSnapshot userDoc = await UserRepository.instance
              .getFirestore()
              .collection("Users")
              .doc(AuthenticationRepository.instance.authUser?.uid)
              .get();
          int currentCoins =
              (userDoc.data() as Map<String, dynamic>)['coins'] ?? 0;

          // Calculate the new total coins
          int newTotalCoins = currentCoins - cost;

          // Update the user's coins in Firestore
          await UserRepository.instance
              .getFirestore()
              .collection("Users")
              .doc(AuthenticationRepository.instance.authUser?.uid)
              .update({'coins': newTotalCoins});

          showCustomSnackBar(
            Colors.green,
            FontAwesomeIcons.circleCheck,
            'Approved!',
            'Your purchase was successful',
          );
        } catch (e) {
          print('Failed to update coins in Firestore: $e');
          showCustomSnackBar(
            Colors.red,
            FontAwesomeIcons.circleExclamation,
            'Error!',
            'Failed to update your coins',
          );
        }
      } else {
        showCustomSnackBar(
          Colors.green,
          FontAwesomeIcons.circleCheck,
          'Approved!',
          'Your purchase was successful',
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            image: const AssetImage('assets/images/bulb.png'),
            title: "Insufficient funds",
            message: "You don't have enough money to make this purchase !",
            imageWidth: 80, // Example width
            imageHeight: 120,
            actionText: "ok", // Specify the action text
            onActionPressed: () {
              // Define your action here
              Navigator.pop(context);
            },
            showCustomRow: false, // Set to false to hide the custom row
            customText:
                "Custom Text", // Pass any string you want to display in the custom row
            closeIcon: FontAwesomeIcons.xmark, // Specify the close icon
            onClosePressed: (BuildContext context) {
              Navigator.pop(context); // Close the dialog
            },
          );
        },
      );
    }
  }

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
                      // FutureBuilder<UserModel>(
                      //   future: UserRepository.instance.fetchUserDetails(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState ==
                      //         ConnectionState.done) {
                      //       // Update userCoins with the fetched coins value
                      //       return Coins(
                      //           coinValue:
                      //               snapshot.data?.coins.toString() ?? '0');
                      //     } else {
                      //       return Coins(
                      //           coinValue: userData!.coins
                      //               .toString()); // Show 0 while loading
                      //     }
                      //   },
                      // ),
                      FutureBuilder<UserModel?>(
                        future:
                            AuthenticationRepository.instance.authUser?.uid !=
                                    null
                                ? UserRepository.instance.fetchUserDetails()
                                : Future.value(
                                    null), // Return null if not authenticated
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            // If authenticated and data is fetched, use the fetched coins value
                            if (snapshot.data != null) {
                              return Coins(
                                  coinValue: snapshot.data!.coins.toString());
                            }
                            // If not authenticated or no data fetched, use local storage coins
                            else {
                              return Coins(
                                  coinValue: userData!.coins.toString());
                            }
                          } else {
                            // Show a loading indicator or a default value while loading
                            return Coins(
                                coinValue: userData!.coins
                                    .toString()); // Or use a loading indicator
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
                              onPurchase: () => makePurchase(1000),
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
