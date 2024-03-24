import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzle/dialog.dart';
import 'package:quizzle/game_specials/lives.dart';
import 'package:quizzle/common_nouns/animal.dart';
import 'package:quizzle/game_specials/coins.dart';
import 'package:quizzle/common_nouns/family.dart';
import 'package:quizzle/common_nouns/general.dart';
import 'package:quizzle/models/user.dart';
import 'package:quizzle/profile.dart';
import 'package:quizzle/sign_up.dart';
import 'package:quizzle/smaller_icon_button.dart';
import 'package:quizzle/game_specials/wins.dart';
import 'package:quizzle/common_nouns/professions.dart';
import 'package:quizzle/common_nouns/time.dart';
import 'package:quizzle/common_nouns/vehicle.dart';
import 'models/user_data.dart';
import 'user_repository.dart';

class Arena extends StatefulWidget {
  const Arena({super.key});

  @override
  State<Arena> createState() => _ArenaState();
}

class _ArenaState extends State<Arena> {
  late Box<UserData> box;

  @override
  void initState() {
    super.initState();
    // Ensure the box is opened before accessing it
    box = Hive.box<UserData>('userDataBox');
  }

  // @override
  // void dispose() {
  //   box.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: UserRepository.instance.fetchUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            UserModel user = snapshot.data!;

            UserData userData = UserData(); // Initialize with default values

            // Update local storage with fetched data
            if (user.accountType == 'premium') {
              userData =
                  UserData(lives: -1, wins: user.wins, coins: user.coins);
              box.put('userData', userData);
            } else if (user.accountType == 'freemium') {
              userData =
                  UserData(lives: 25, wins: user.wins, coins: user.coins);
              box.put('userData', userData);
            }

            // Proceed with building the UI for accounted users
            return _buildAccountedUserUI(user, userData);
          } else {
            // Use local storage for non-accounted users
            UserData? userData = box.get('userData');
            if (userData == null) {
              userData = UserData(); // Initialize with default values
              box.put('userData', userData);
            }
            // Proceed with building the UI for non-accounted users
            return _buildNonAccountedUserUI(userData);
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading spinner while waiting for the data
          return const Center(child: CircularProgressIndicator());
        } else {
          // Handle other states or errors
          return const Scaffold(
              body: Center(child: Text('An error occurred.')));
        }
      },
    );
  }

  Widget _buildAccountedUserUI(UserModel user, UserData userData) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          margin: const EdgeInsets.only(left: 2),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SmallerFaIconButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ProfilePage(
                              user: user,
                            );
                          },
                        ),
                      );
                    },
                    iconData: FontAwesomeIcons.user,
                  ),
                ),
                Lives(livesValues: userData.lives.toString()),
                Wins(winsValue: user.wins.toString()),
                Coins(coinValue: user.coins.toString()),
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

  Widget _buildNonAccountedUserUI(UserData userData) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          margin: const EdgeInsets.only(left: 2),
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
                                "This feature is only accessible to registered users. Create an account to unlock profile",
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
                Lives(livesValues: userData.lives.toString()),
                Wins(winsValue: userData.wins.toString()),
                Coins(coinValue: userData.coins.toString()),
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
