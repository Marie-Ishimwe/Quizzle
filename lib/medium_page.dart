import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzle/authentication_repository.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/dialog.dart';
import 'package:quizzle/header.dart';
import 'package:quizzle/user_repository.dart';
import 'models/user_data.dart';
import 'smaller_icon_button.dart';
import 'orange_btn.dart';
import 'questions.dart';
import 'snackbar.dart';

class MediumLevel extends StatefulWidget {
  const MediumLevel({super.key});

  @override
  State<MediumLevel> createState() => _MediumLevelState();
}

class _MediumLevelState extends State<MediumLevel> {
  final formKey = GlobalKey<FormState>();
  final answerController = TextEditingController();
  int currentQuestionIndex = 0;
  late List<Question> mediumQuestions;
  int correctAnswersCount = 0; // Initialize count of correct answers
  int levelMarks = Question.getQuestionWeight(Difficulty.medium);
  int hintCount = 0;
  late Box<UserData> box;
  Timer? liveTimer;
  UserData? userData;

  @override
  void initState() {
    super.initState();
    print("Before accessing Hive box");
    box = Hive.box<UserData>('userDataBox');
    print("After accessing Hive box");
    userData = box.get('userData');
    if (userData == null) {
      userData = UserData();
      box.put('userData', userData!);
    }

    // Shuffle and select 10 medium-level questions
    mediumQuestions = List.from(questions
        .where((question) => question.difficulty == Difficulty.medium));
    mediumQuestions.shuffle();
    mediumQuestions = mediumQuestions.take(10).toList();
    liveTimer = Timer.periodic(const Duration(minutes: 30), (timer) {
      setState(() {
        userData!.lives++;
      });
    });
  }

  @override
  void dispose() {
    liveTimer?.cancel(); // Cancel the timer when the widget is disposed
    box.close();
    super.dispose();
  }

  void submitAnswer() async {
    if (formKey.currentState!.validate()) {
      final userAnswer = answerController.text.trim();
      final correctAnswer =
          mediumQuestions[currentQuestionIndex].answerText.toLowerCase();

      if (userAnswer.toLowerCase().contains(correctAnswer)) {
        // Show correct message
        await showCustomSnackBar(
          Colors.green,
          FontAwesomeIcons.circleCheck,
          'Correct!',
          'Coins earned: $levelMarks',
        );
        // Increment the count of correct answers
        setState(() {
          correctAnswersCount++;
        });
      } else {
        // Show incorrect message
        await showCustomSnackBar(
          Colors.red,
          FontAwesomeIcons.circleXmark,
          'Incorrect!',
          'The correct answer was: $correctAnswer',
        ); // Decrease lives
        setState(() {
          userData!.lives--;
        });
      }
      if (currentQuestionIndex + 1 < mediumQuestions.length &&
          userData!.lives > 0) {
        setState(() {
          currentQuestionIndex++;
        });
      } else if (userData!.lives <= 0) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialog(
              image: const AssetImage('assets/images/bulb.png'),
              title: "Game over",
              message:
                  "You have runout of lives! You will have to wait for some time before you can play again!",
              imageWidth: 80, // Example width
              imageHeight: 120,
              actionText: "Playground", // Specify the action text
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
      } else {
        int playerScore = correctAnswersCount * levelMarks;
        print(hintCount);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialog(
              image: const AssetImage('assets/images/victory_stars.png'),
              title: "Well done",
              message:
                  "Correct answers: $correctAnswersCount\nIncorrect answers: ${2 - correctAnswersCount}\nCoins earned: $playerScore",
              imageWidth: 205, // Example width
              imageHeight: 113,
              actionText: "Retry",
              onActionPressed: () {
                // Define your action here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MediumLevel()),
                );
              },
              showCustomRow: true,
              customText:
                  "Results", // Pass any string you want to display in the custom row
              closeIcon: FontAwesomeIcons.house, // Specify the close icon
              onClosePressed: (BuildContext context) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Playground()));
              },
            );
          },
        );

        // Check if the user is authenticated
        if (AuthenticationRepository.instance.authUser?.uid != null) {
          // Fetch the user's current coin count
          DocumentSnapshot userDoc = await UserRepository.instance
              .getFirestore()
              .collection("Users")
              .doc(AuthenticationRepository.instance.authUser?.uid)
              .get();
          int currentCoins =
              (userDoc.data() as Map<String, dynamic>)['coins'] ?? 0;
          int currentWins =
              (userDoc.data() as Map<String, dynamic>)['wins'] ?? 0;
          int currentHintCount =
              (userDoc.data() as Map<String, dynamic>)['hints'] ?? 0;

          // Calculate the new total coins
          int newTotalCoins = currentCoins + playerScore;

          // Update the user's coins and wins in Firestore
          Map<String, dynamic> updateData = {
            'coins': newTotalCoins, // Update the coins field with the new total
            'wins': correctAnswersCount == mediumQuestions.length
                ? currentWins + 1
                : currentWins,
            // Update the wins field if all questions are answered correctly
            'hints': currentHintCount + hintCount,
          };

          try {
            await UserRepository.instance.updateSingleAttribute(updateData);
            // Navigate to the next screen or show a dialog after updating the coins
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return CustomDialog(
                  image: const AssetImage('assets/images/victory_stars.png'),
                  title: "Well done",
                  message:
                      "Correct answers: $correctAnswersCount\nIncorrect answers: ${mediumQuestions.length - correctAnswersCount}\nCoins earned: $playerScore",
                  imageWidth: 205,
                  imageHeight: 113,
                  actionText: "Retry",
                  onActionPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MediumLevel()),
                    );
                  },
                  showCustomRow: true,
                  customText: "Results",
                  closeIcon: FontAwesomeIcons.house,
                  onClosePressed: (BuildContext context) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Playground(),
                      ),
                    );
                  },
                );
              },
            );
          } catch (e) {
            print('Failed to update coins: $e');
          }
        } else {
          userData!.coins += correctAnswersCount * levelMarks;
          userData?.wins = correctAnswersCount == mediumQuestions.length
              ? userData!.wins + 1
              : userData!.wins;
          userData!.hints += hintCount;
          box.put('userData', userData!);
        }
      }
      answerController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              CustomHeader(
                title: 'Anagram',
                onCloseTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        image: const AssetImage('assets/images/lose.png'),
                        title: "Quitting",
                        message:
                            "Do you really want to quit playing and risk losing your progress?",
                        imageWidth: 120, // Example width
                        imageHeight: 111,
                        actionText: "Yes",
                        onActionPressed: () {
                          // Define your action here
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Playground()),
                          );
                        },
                        showCustomRow:
                            true, // Set to true to show the custom row
                        customText:
                            "Custom Text", // Pass any string you want to display in the custom row
                        closeIcon:
                            FontAwesomeIcons.xmark, // Specify the close icon
                        onClosePressed: (BuildContext context) {
                          Navigator.pop(context); // Close the dialog
                        },
                      );
                    },
                  );
                },
                onQuestionTap: () {
                  String guideline = Question.guidelines[
                          mediumQuestions[currentQuestionIndex].difficulty] ??
                      'No guidelines available.';
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        image: const AssetImage('assets/images/goal.png'),
                        title: "Guidelines",
                        message: guideline,
                        imageWidth: 120, // Example width
                        imageHeight: 120,
                        actionText: "Ok", // Specify the action text
                        onActionPressed: () {
                          // Define your action here
                          Navigator.pop(context);
                        },
                        showCustomRow:
                            false, // Set to false to hide the custom row
                        customText:
                            "Custom Text", // Pass any string you want to display in the custom row
                        closeIcon:
                            FontAwesomeIcons.xmark, // Specify the close icon
                        onClosePressed: (BuildContext context) {
                          Navigator.pop(context); // Close the dialog
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 25,
                          child: ClipOval(
                            child: Container(
                              width: 250,
                              height: 250,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                  )
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment(-1, 6.123234262925839e-17),
                                  end: Alignment(6.123234262925839e-17, 1),
                                  colors: [
                                    Color.fromRGBO(
                                        238, 172, 108, 0.8600000143051147),
                                    Color.fromRGBO(247, 127, 8, 1)
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Color(0xFFF8F4F8),
                                        fontSize: 18,
                                        fontFamily: 'StudioFeixenSansTRIAL',
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 0,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${mediumQuestions[currentQuestionIndex].questionText.split(' ')[0]} ',
                                        ),
                                        TextSpan(
                                          text: mediumQuestions[
                                                  currentQuestionIndex]
                                              .questionText
                                              .split(' ')[1],
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${mediumQuestions[currentQuestionIndex].questionText.split(' ').sublist(2).join(' ')}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 65,
                          child: Container(
                            width: 200,
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF88F1E),
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 221, 129, 37),
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 238, 147, 56),
                                  offset: Offset(0, -3),
                                  // blurRadius: 1,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'question ${currentQuestionIndex + 1}',
                                style: const TextStyle(
                                  color: Color(0xFFFFF9DB),
                                  fontFamily: 'Stopbuck',
                                  fontSize: 24,
                                  // letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 350,
                          left: 35,
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: size.width * .8,
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    textAlign: TextAlign.center,
                                    controller: answerController,
                                    cursorColor: const Color(0xFFF56300),
                                    style: const TextStyle(
                                      color: Color(
                                          0xFFF56300), // Set the text color to orange
                                      fontSize: 16,
                                      fontFamily: 'StudioFeixenSansTRIAL',
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFF8F4F8),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      hintText: "Type your answer",
                                      hintStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 247, 169, 117),
                                        fontSize: 16,
                                        fontFamily: 'StudioFeixenSansTRIAL',
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      errorStyle: const TextStyle(
                                        // Customize the style of the error message
                                        color: Color(
                                            0xFFF8F4F8), // Change the color of the error message
                                        fontSize: 14,
                                        fontFamily: 'StudioFeixenSansTRIAL',
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        //     "No answer was provided");
                                        return 'No answer was provided';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                CustomOrangeButton(
                                  buttonText: "Submit",
                                  onPressed: submitAnswer,
                                  buttonWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 155,
                          child: Container(
                            width: 164,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/quirrel.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SmallerFaIconButton(
                            onTap: () {
                              hintCount++;
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return CustomDialog(
                                    image: const AssetImage(
                                        'assets/images/bulb.png'),
                                    title: "Hint",
                                    message:
                                        mediumQuestions[currentQuestionIndex]
                                            .hint,
                                    imageWidth: 80, // Example width
                                    imageHeight: 120,
                                    actionText: "Ok", // Specify the action text
                                    onActionPressed: () {
                                      // Define your action here
                                      Navigator.pop(context);
                                    },
                                    showCustomRow:
                                        false, // Set to false to hide the custom row
                                    customText:
                                        "Custom Text", // Pass any string you want to display in the custom row
                                    closeIcon: FontAwesomeIcons
                                        .xmark, // Specify the close icon
                                    onClosePressed: (BuildContext context) {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                  );
                                },
                              );
                            },
                            iconData: FontAwesomeIcons.lightbulb,
                          ),
                        ),
                      ],
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
