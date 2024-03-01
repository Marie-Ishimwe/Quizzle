enum Difficulty {
  easy,
  medium,
  tricky,
  tough,
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
  Question(
    questionText: 'What gets wet while drying?',
    answerText: 'towel',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What has a face and two hands but no arms or legs?',
    answerText: 'clock',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: "What has a head and a tail but can't clap?",
    answerText: 'coin',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What has words, but never speaks?',
    answerText: 'book',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: "What has many keys but can't open a single lock?",
    answerText: 'piano',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What building has the most stories?',
    answerText: 'library',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What runs all around a backyard, yet never moves?',
    answerText: 'fense',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What gets bigger when more is taken away?',
    answerText: 'hoe',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: "What is black when it's clean and white when it's dirty?",
    answerText: 'blackboard',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What kind of band never plays music?',
    answerText: 'clock',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'Where do you find an ocean with no water?',
    answerText: 'map',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What is full of holes but still holds water?',
    answerText: 'sponge',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'You buy me to eat, but you never eat me. What am I?',
    answerText: 'fork',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What must be broken before you can use it?',
    answerText: 'egg',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What bank never has any money?',
    answerText: 'riverbank',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What kind of cup can’t hold anything to drink?',
    answerText: 'cupcake',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What has a lot of teeth but can’t chew a thing?',
    answerText: 'comb',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText:
        'I have no legs so I never walk, but I always run. What am I?',
    answerText: 'river',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'I am not alive, but I can still die. What am I?',
    answerText: 'battery',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What can you easily break without touching it?',
    answerText: 'promise',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'I’m tall when I’m young and short when I’m old. What am I?',
    answerText: 'candle',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What can’t talk but will reply when spoken to?',
    answerText: 'echo',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What can be full without eating a thing?',
    answerText: 'moon',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: "What has a lot of eyes but can’t see? ",
    answerText: 'potato',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What has one head, one foot, and four legs?',
    answerText: 'bed',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What has a lot of words but never speaks?',
    answerText: 'book',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What can you taste everyday but never eat?',
    answerText: 'Toothpaste',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'What has a tongue but cannot talk?',
    answerText: 'shoe',
    difficulty: Difficulty.tough,
  ),
  Question(
    questionText: 'Engine – Olive – Coconut',
    answerText: 'oil',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: ' Lighthouse – Stars – Diamonds',
    answerText: 'shine',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Bag – Shorts – Kangaroo',
    answerText: 'pockets',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Broccoli – Carrot – Pumpkin ',
    answerText: 'vegetables',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Circle – Star – Triangle',
    answerText: 'shapes',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Eswatini – A Chess Game – A Deck of Cards',
    answerText: 'king',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Tennis – Bowling – Swimming',
    answerText: 'sports',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Human – Coin – Family',
    answerText: 'head',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Email Address – Morse Code – Lowercase J’s',
    answerText: 'dots',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Dell – Gateway – Apple',
    answerText: 'Computers',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Eye – Kidney – Lung',
    answerText: 'organs',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Rwanda – Uganda – Germany',
    answerText: 'countries',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Bruce Melodie – Chris Brown – Kivumbi',
    answerText: 'singers',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Mercury – Uranus – Earth',
    answerText: 'planets',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Asia – Europe – Australia',
    answerText: 'continents',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Bananas – Sunflowers – School buses',
    answerText: 'Yellow',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Comedy – Drama – Action',
    answerText: 'Genres',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Rose - Tulip - Daisy',
    answerText: 'Flowers',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Chair - Table - Bed',
    answerText: 'Furniture',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Lion - Tiger - Bear',
    answerText: 'Wild animals',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Engine – Olive – Coconut',
    answerText: 'oil',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Engine – Olive – Coconut',
    answerText: 'oil',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Engine – Olive – Coconut',
    answerText: 'oil',
    difficulty: Difficulty.tricky,
  ),
  Question(
    questionText: 'Engine – Olive – Coconut',
    answerText: 'oil',
    difficulty: Difficulty.tricky,
  ),
];
