import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/dialog.dart';
import 'package:quizzle/header.dart';
import 'smaller_icon_button.dart';
import 'orange_btn.dart';
import 'questions.dart';
import 'snackbar.dart';
// import 'package:fluttertoast/fluttertoast.dart';

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

  @override
  void initState() {
    super.initState();
    // Shuffle and select 10 medium-level questions
    mediumQuestions = List.from(questions
        .where((question) => question.difficulty == Difficulty.medium));
    mediumQuestions.shuffle();
    mediumQuestions = mediumQuestions.take(10).toList();
  }

  void submitAnswer() async {
    if (formKey.currentState!.validate()) {
      // Validate answer
      final userAnswer = answerController.text.trim();
      final correctAnswer =
          mediumQuestions[currentQuestionIndex].answerText.toLowerCase();
      if (userAnswer.toLowerCase() == correctAnswer) {
        // Show correct message
        await showCustomSnackBar(
          context,
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
          context,
          Colors.red,
          FontAwesomeIcons.circleXmark,
          'Incorrect!',
          'The correct answer was: $correctAnswer',
        );
      }
      // Move to the next question if available
      if (currentQuestionIndex + 1 < mediumQuestions.length) {
        setState(() {
          currentQuestionIndex++;
        });
      } else {
        // If all questions are answered, navigate to Playground
        int playerScore = correctAnswersCount * levelMarks;

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialog(
              image: const AssetImage('images/victory_stars.png'),
              title: "Well done",
              message:
                  "Correct answers: $correctAnswersCount\nIncorrect answers: ${10 - correctAnswersCount}\nCoins earned: $playerScore",
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
      }
      // Clear the text field
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
            children: [
              CustomHeader(
                title: 'Anagram',
                onCloseTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        image: const AssetImage('images/lose.png'),
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
                        image: const AssetImage('images/goal.png'),
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
                          left: 45,
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
                                      // floatingLabelBehavior:
                                      //     FloatingLabelBehavior.auto,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        // showToastMessage(
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
                                  buttonWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                  onPressed: submitAnswer,
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
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return CustomDialog(
                                    image: const AssetImage('images/bulb.png'),
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
