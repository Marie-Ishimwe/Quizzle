import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/header.dart';
import 'icon_smaller.dart';
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

  @override
  void initState() {
    super.initState();
    // Shuffle and select 10 medium-level questions
    mediumQuestions = List.from(questions
        .where((question) => question.difficulty == Difficulty.medium));
    mediumQuestions.shuffle();
    mediumQuestions = mediumQuestions.take(10).toList();
  }

  void submitAnswer() {
    if (formKey.currentState!.validate()) {
      // Validate answer
      final userAnswer = answerController.text.trim();
      final correctAnswer =
          mediumQuestions[currentQuestionIndex].answerText.toLowerCase();
      if (userAnswer.toLowerCase() == correctAnswer) {
        // Show correct message
        showCustomSnackBar(
          context,
          Colors.green,
          FontAwesomeIcons.circleCheck,
          'Correct!',
          'Coins earned: $correctAnswer',
        );
      } else {
        // Show incorrect message
        showCustomSnackBar(
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Playground()),
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
              const CustomHeader(title: 'Anagram'),
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
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFFE9E6D1),
                                          offset: Offset(0, 2),
                                          // blurRadius: 4,
                                          spreadRadius: 1),
                                    ],
                                  ),
                                  width: size.width * .8,
                                  height: 55,
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Playground()));
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

  // void showToastMessage(String message) {
  //   Fluttertoast.showToast(
  //       msg: message, //message to show toast
  //       toastLength: Toast.LENGTH_LONG, //duration for message to show
  //       gravity: ToastGravity.CENTER, //where you want to show, top, bottom
  //       timeInSecForIosWeb: 1, //for iOS only
  //       //backgroundColor: Colors.red, //background Color for message
  //       textColor: Colors.white, //message text color
  //       fontSize: 16.0 //message font size
  //       );
  // }
}
