import 'package:flutter/foundation.dart';

enum Difficulty {
  easy,
  medium,
  hard,
}

class Question {
  final String questionText;
  final String answerText;
  final Difficulty difficulty;

  Question({
    required this.questionText,
    required this.answerText,
    required this.difficulty,
  });
}

List<Question> questions = [
  Question(
    questionText: 'Change disease into a popular place to go to on a holiday',
    answerText: 'seaside',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change fringe into a part of the body',
    answerText: 'finger',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change cheater into a job',
    answerText: 'teacher',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change flow into an animal',
    answerText: 'wolf',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change genre into a color',
    answerText: 'green',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change heart into a planet',
    answerText: 'earth',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change thing into a time of day',
    answerText: 'night',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change flog into a sport',
    answerText: 'golf',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change keen into a part of the body',
    answerText: 'knee',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change tea into a verb',
    answerText: 'eat',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change shore into animal',
    answerText: 'horse',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change nails into a slow animals',
    answerText: 'snail',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change panel into a mean of transportation',
    answerText: 'plane',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change raptor into a talkative animal',
    answerText: 'parrot',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change pool into a sport',
    answerText: 'polo',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change runes into a job',
    answerText: 'nurse',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change melon into a fruit',
    answerText: 'lemon',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change act into an animal',
    answerText: 'cat',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change ones into a body part',
    answerText: 'nose',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change pains into a country',
    answerText: 'spain',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change odor into something you can open',
    answerText: 'door',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change sharp into musical instruments',
    answerText: 'harps',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change tuna into a member of the family',
    answerText: 'aunt',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change resister into a member of the family',
    answerText: 'sister',
    difficulty: Difficulty.medium,
  ),
  Question(
    questionText: 'Change repaint into a job',
    answerText: 'painter',
    difficulty: Difficulty.medium,
  ),
];
