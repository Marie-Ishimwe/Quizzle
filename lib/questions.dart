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
  final String hint;

  // Static property for guidelines
  static const Map<Difficulty, String> guidelines = {
    Difficulty.easy:
        'The list of words you were given share a common theme, except for one word which does not belong to the group. Your task is to identify the odd word and write it down.',
    Difficulty.medium:
        'Your task is to rearrange the letters of the word you were given to form a different word or phrase. Mix the letters until you find the desired word. It could be an object, a place, or even an animal. Write down your answer and see if you can solve them all.',
    Difficulty.tricky:
        'The three words you were given have something in common. Your task is to find the common noun that relates to all them. For example, if the words are \'apple,\' \'banana,\' and \'orange,\' the common noun would be \'fruit.',
    Difficulty.tough:
        'Each riddle describes something without naming it. Your task is to guess the noun being described. Read the clues carefully, think about what object, place, or person it could be, and write down your answer. Remember, all the answers are common nouns you use every day. Good luck and have fun solving the riddles!',
  };

  // Static method to get marks for each difficulty level
  static int getQuestionWeight(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return 1;
      case Difficulty.medium:
        return 2;
      case Difficulty.tricky:
        return 5;
      case Difficulty.tough:
        return 10;
      default:
        return 0; // Default case for safety, should not be reached
    }
  }

  Question({
    required this.questionText,
    required this.answerText,
    required this.difficulty,
    required this.hint,
  });

  // Method to get the guideline for the current difficulty
  String getGuideline() {
    return guidelines[difficulty] ?? '';
  }
}

// Example usage with all questions
List<Question> questions = [
  Question(
    questionText: 'Change disease into a popular place to go to on a holiday',
    answerText: 'seaside',
    difficulty: Difficulty.medium,
    hint: 'Think of a sandy destination often associated with relaxation.',
  ),
  Question(
    questionText: 'Change fringe into a part of the body',
    answerText: 'finger',
    difficulty: Difficulty.medium,
    hint: 'Think of an exterior part of the body.',
  ),
  Question(
    questionText: 'Change cheater into a job',
    answerText: 'teacher',
    difficulty: Difficulty.medium,
    hint: 'Think of someone who imparts knowledge.',
  ),
  Question(
    questionText: 'Change flow into an animal',
    answerText: 'wolf',
    difficulty: Difficulty.medium,
    hint: 'Think of something known howling in the night.',
  ),
  Question(
    questionText: 'Change genre into a color',
    answerText: 'green',
    difficulty: Difficulty.medium,
    hint: 'Think of a color that is often associated with nature.',
  ),
  Question(
    questionText: 'Change heart into a planet',
    answerText: 'earth',
    difficulty: Difficulty.medium,
    hint: 'Think of the third planet from the sun.',
  ),
  Question(
    questionText: 'Change thing into a time of day',
    answerText: 'night',
    difficulty: Difficulty.medium,
    hint: 'Think of the time when stars appear in the sky.',
  ),
  Question(
    questionText: 'Change flog into a sport',
    answerText: 'golf',
    difficulty: Difficulty.medium,
    hint: 'Tink of a sport played on a course with clubs and balls.',
  ),
  Question(
    questionText: 'Change keen into a part of the body',
    answerText: 'knee',
    difficulty: Difficulty.medium,
    hint: 'Think of a joint that helps in walking.',
  ),
  Question(
    questionText: 'Change tea into a verb',
    answerText: 'eat',
    difficulty: Difficulty.medium,
    hint: 'Think of the action of consuming food.',
  ),
  Question(
    questionText: 'Change shore into animal',
    answerText: 'horse',
    difficulty: Difficulty.medium,
    hint: 'Think of a majestic animal often ridden by humans.',
  ),
  Question(
    questionText: 'Change nails into a slow animal',
    answerText: 'snail',
    difficulty: Difficulty.medium,
    hint: 'Think of a small mollusk with a spiral shell.',
  ),
  Question(
    questionText: 'Change panel into a means of transportation',
    answerText: 'plane',
    difficulty: Difficulty.medium,
    hint: 'Think of a vehicle that flies in the sky.',
  ),
  Question(
    questionText: 'Change raptor into a talkative animal',
    answerText: 'parrot',
    difficulty: Difficulty.medium,
    hint: 'Think of something known for mimicking human speech.',
  ),
  Question(
    questionText: 'Change pool into a sport',
    answerText: 'polo',
    difficulty: Difficulty.medium,
    hint: 'Think of a sport played on horseback with mallets.',
  ),
  Question(
    questionText: 'Change runes into a job',
    answerText: 'nurse',
    difficulty: Difficulty.medium,
    hint: 'Think of someone who provides medical care in hospitals.',
  ),
  Question(
    questionText: 'Change melon into a fruit',
    answerText: 'lemon',
    difficulty: Difficulty.medium,
    hint: 'Think of a yellow citrus fruit often used in cooking and beverages.',
  ),
  Question(
    questionText: 'Change act into an animal',
    answerText: 'cat',
    difficulty: Difficulty.medium,
    hint:
        'Think of something commonly kept as a pet and known for its independent nature.',
  ),
  Question(
    questionText: 'Change ones into a body part',
    answerText: 'nose',
    difficulty: Difficulty.medium,
    hint: 'Think of something used for smelling and breathing.',
  ),
  Question(
    questionText: 'Change pains into a country',
    answerText: 'Spain',
    difficulty: Difficulty.medium,
    hint:
        'Think of a something located in southwestern Europe, famous for its cuisine and culture.',
  ),
  Question(
    questionText: 'Change odor into something you can open',
    answerText: 'door',
    difficulty: Difficulty.medium,
    hint:
        'Think of something that provides entry and exit to a room or building.',
  ),
  Question(
    questionText: 'Change sharp into musical instruments',
    answerText: 'harps',
    difficulty: Difficulty.medium,
    hint:
        'Think of something that has strings and is played with fingers or a pedal.',
  ),
  Question(
    questionText: 'Change tuna into a member of the family',
    answerText: 'aunt',
    difficulty: Difficulty.medium,
    hint: 'Think of a female relative.',
  ),
  Question(
    questionText: 'Change resister into a member of the family',
    answerText: 'sister',
    difficulty: Difficulty.medium,
    hint: 'Think of female sibling.',
  ),
  Question(
    questionText: 'Change repaint into a job',
    answerText: 'painter',
    difficulty: Difficulty.medium,
    hint: 'Think of someone who applies paint to surfaces.',
  ),
  Question(
    questionText: 'What gets wet while drying?',
    answerText: 'towel',
    difficulty: Difficulty.tough,
    hint:
        'Think of something that is used to dry oneself after bathing or swimming.',
  ),
  Question(
    questionText: 'What has a face and two hands but no arms or legs?',
    answerText: 'clock',
    difficulty: Difficulty.tough,
    hint: 'Think of something used to tell time.',
  ),
  Question(
    questionText: "What has a head and a tail but can't clap?",
    answerText: 'coin',
    difficulty: Difficulty.tough,
    hint: 'Think of something used as currency.',
  ),
  Question(
    questionText: 'What has words, but never speaks?',
    answerText: 'book',
    difficulty: Difficulty.tough,
    hint: 'Think of something that contains written information.',
  ),
  Question(
    questionText: "What has many keys but can't open a single lock?",
    answerText: 'piano',
    difficulty: Difficulty.tough,
    hint: 'Think of a musical instrument with keys.',
  ),
  Question(
    questionText: 'What building has the most stories?',
    answerText: 'library',
    difficulty: Difficulty.tough,
    hint: 'Think of something which contains books for borrowing or reading.',
  ),
  Question(
    questionText: 'What runs all around a backyard, yet never moves?',
    answerText: 'fence',
    difficulty: Difficulty.tough,
    hint:
        'Think of something used to mark property boundaries and provide security.',
  ),
  Question(
    questionText: 'What gets bigger when more is taken away?',
    answerText: 'hole',
    difficulty: Difficulty.tough,
    hint: 'Think of an empty space or void in a surface.',
  ),
  Question(
    questionText: "What is black when it's clean and white when it's dirty?",
    answerText: 'chalkboard',
    difficulty: Difficulty.tough,
    hint: 'Think of something used for writing, especially at school',
  ),
  Question(
    questionText: 'What kind of band never plays music?',
    answerText: 'rubber band',
    difficulty: Difficulty.tough,
    hint:
        'Think of something that is often used to hold things together or secure objects.',
  ),
  Question(
    questionText: 'Where do you find an ocean with no water?',
    answerText: 'map',
    difficulty: Difficulty.tough,
    hint:
        'Think of something that is used for navigation or depicting geographical features.',
  ),
  Question(
    questionText: 'What is full of holes but still holds water?',
    answerText: 'sponge',
    difficulty: Difficulty.tough,
    hint: 'Think of something that is used for cleaning or absorbing liquid.',
  ),
  Question(
    questionText: 'You buy me to eat, but you never eat me. What am I?',
    answerText: 'plate',
    difficulty: Difficulty.tough,
    hint: 'Think of something that is used for serving food.',
  ),
  Question(
    questionText: 'What must be broken before you can use it?',
    answerText: 'egg',
    difficulty: Difficulty.tough,
    hint: 'Think of something that contains a potential life inside.',
  ),
  Question(
    questionText: 'What bank never has any money?',
    answerText: 'riverbank',
    difficulty: Difficulty.tough,
    hint: 'Think of something that is found alongside a body of water.',
  ),
  Question(
    questionText: 'What kind of cup can’t hold anything to drink?',
    answerText: 'cupcake',
    difficulty: Difficulty.tough,
    hint: 'Think of something a small baked dessert.',
  ),
  Question(
    questionText: 'What has a lot of teeth but can’t chew a thing?',
    answerText: 'comb',
    difficulty: Difficulty.tough,
    hint: 'Think of something that is used for grooming hair.',
  ),
  Question(
    questionText:
        'I have no legs so I never walk, but I always run. What am I?',
    answerText: 'river',
    difficulty: Difficulty.tough,
    hint:
        'Think of something that flows continuously in a particular direction.',
  ),
  Question(
    questionText: 'I am not alive, but I can still die. What am I?',
    answerText: 'battery',
    difficulty: Difficulty.tough,
    hint: 'Think of something that stores electrical energy.',
  ),
  Question(
    questionText: 'What can you easily break without touching it?',
    answerText: 'promise',
    difficulty: Difficulty.tough,
    hint: 'Think of something that is assured or committed.',
  ),
  Question(
    questionText: 'I’m tall when I’m young and short when I’m old. What am I?',
    answerText: 'candle',
    difficulty: Difficulty.tough,
    hint: 'Think of something that provides light when lit.',
  ),
  Question(
    questionText: 'What can’t talk but will reply when spoken to?',
    answerText: 'echo',
    difficulty: Difficulty.tough,
    hint: 'Think of a sound reflection phenomenon.',
  ),
  Question(
    questionText: 'What can be full without eating a thing?',
    answerText: 'moon',
    difficulty: Difficulty.tough,
    hint: 'Think of something that is visible in the night sky.',
  ),
  Question(
    questionText: "What has a lot of eyes but can’t see? ",
    answerText: 'potato',
    difficulty: Difficulty.tough,
    hint: 'Think of a starchy tuber.',
  ),
  Question(
    questionText: 'What has one head, one foot, and four legs?',
    answerText: 'bed',
    difficulty: Difficulty.tough,
    hint: 'Think of something that is used for sleeping.',
  ),
  Question(
    questionText: 'What has a lot of words but never speaks?',
    answerText: 'dictionary',
    difficulty: Difficulty.tough,
    hint:
        'Think of something that contains definitions and explanations of words.',
  ),
  Question(
    questionText: 'What can you taste every day but never eat?',
    answerText: 'toothpaste',
    difficulty: Difficulty.tough,
    hint: 'Think of something that is used for oral hygiene.',
  ),
  Question(
    questionText: 'What has a tongue but cannot talk?',
    answerText: 'shoe',
    difficulty: Difficulty.tough,
    hint:
        'Think of something that is worn on the feet for protection and comfort.',
  ),
  Question(
    questionText: 'Engine – Olive – Coconut',
    answerText: 'oil',
    difficulty: Difficulty.tricky,
    hint: 'Think of something that is used for cooking or as a lubrication.',
  ),
  Question(
    questionText: ' Lighthouse – Stars – Diamonds',
    answerText: 'shine',
    difficulty: Difficulty.tricky,
    hint: 'Think of something that produces light or glimmers brightly.',
  ),
  Question(
    questionText: 'Bag – Shorts – Kangaroo',
    answerText: 'pockets',
    difficulty: Difficulty.tricky,
    hint:
        'Think of something that is found in clothing or bags for holding small items.',
  ),
  Question(
    questionText: 'Broccoli – Carrot – Pumpkin ',
    answerText: 'vegetables',
    difficulty: Difficulty.tricky,
    hint: 'Think of edible plants that are often used in cooking.',
  ),
  Question(
    questionText: 'Circle – Star – Triangle',
    answerText: 'shapes',
    difficulty: Difficulty.tricky,
    hint: 'Think of geometric forms.',
  ),
  Question(
    questionText: 'Eswatini – A Chess Game – A Deck of Cards',
    answerText: 'king',
    difficulty: Difficulty.tricky,
    hint: 'Think of a chess piece or a royal title.',
  ),
  Question(
    questionText: 'Tennis – Bowling – Swimming',
    answerText: 'sports',
    difficulty: Difficulty.tricky,
    hint: 'Think of physical activities or games.',
  ),
  Question(
    questionText: 'Human – Coin – Family',
    answerText: 'head',
    difficulty: Difficulty.tricky,
    hint: 'Think of a part of the body or a leader of a family.',
  ),
  Question(
    questionText: 'Email Address – Morse Code – Lowercase J’s',
    answerText: 'dots',
    difficulty: Difficulty.tricky,
    hint: 'Think of small round marks or signals.',
  ),
  Question(
    questionText: 'Dell – Gateway – Apple',
    answerText: 'computers',
    difficulty: Difficulty.tricky,
    hint: 'Think of electronic devices used for processing data.',
  ),
  Question(
    questionText: 'Eye – Kidney – Lung',
    answerText: 'organs',
    difficulty: Difficulty.tricky,
    hint: 'Think of a part of the body with specific functions.',
  ),
  Question(
    questionText: 'Rwanda – Uganda – Germany',
    answerText: 'countries',
    difficulty: Difficulty.tricky,
    hint: 'Think of nations or sovereign states.',
  ),
  Question(
    questionText: 'Bruce Melodie – Chris Brown – Kivumbi',
    answerText: 'singers',
    difficulty: Difficulty.tricky,
    hint: 'Think of people who perform vocal music.',
  ),
  Question(
    questionText: 'Mercury – Uranus – Earth',
    answerText: 'planets',
    difficulty: Difficulty.tricky,
    hint: 'Think of celestial bodies that orbit the sun.',
  ),
  Question(
    questionText: 'Asia – Europe – Australia',
    answerText: 'continents',
    difficulty: Difficulty.tricky,
    hint: 'Think of large landmasses on Earth.',
  ),
  Question(
    questionText: 'Bananas – Sunflowers – School buses',
    answerText: 'yellow',
    difficulty: Difficulty.tricky,
    hint: 'Think of a color that is often associated with sunshine.',
  ),
  Question(
    questionText: 'Comedy – Drama – Action',
    answerText: 'genres',
    difficulty: Difficulty.tricky,
    hint: 'Think of categories of artistic expression.',
  ),
  Question(
    questionText: 'Rose - Tulip - Daisy',
    answerText: 'flowers',
    difficulty: Difficulty.tricky,
    hint:
        'Think of blossoming plants that are often appreciated for their beauty.',
  ),
  Question(
    questionText: 'Chair - Table - Bed',
    answerText: 'furniture',
    difficulty: Difficulty.tricky,
    hint: 'Think of items that are used for sitting, eating, or sleeping.',
  ),
  Question(
    questionText: 'Lion - Tiger - Bear',
    answerText: 'wild animals',
    difficulty: Difficulty.tricky,
    hint: 'Think of creatures that are not typically domestic.',
  ),
  Question(
    questionText: 'Engine – Olive – Coconut',
    answerText: 'oil',
    difficulty: Difficulty.tricky,
    hint: 'Think of a viscous liquid used in various applications.',
  ),
  Question(
    questionText: 'blue - pink - park - black',
    answerText: 'park',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is colors.',
  ),
  Question(
    questionText: 'apples - bananas - oranges - chairs',
    answerText: 'chairs',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is fruits.',
  ),
  Question(
    questionText: 'postman - doctor - hospital - secretary',
    answerText: 'hospital',
    difficulty: Difficulty.easy,
    hint:
        'The common theme in this question is professions that are associated with workplaces.',
  ),
  Question(
    questionText: 'hungry - tired - happy - friend',
    answerText: 'friend',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is emotions and states of being.',
  ),
  Question(
    questionText: 'Friday - Sunday - March - Wednesday',
    answerText: 'March',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is days of the week.',
  ),
  Question(
    questionText: 'seven - first - eight - twenty',
    answerText: 'twenty',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is numerical order.',
  ),
  Question(
    questionText: 'German - Russia - England - Scotland',
    answerText: 'German',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is nations or countries',
  ),
  Question(
    questionText: 'February - November - Monday - July',
    answerText: 'Monday',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is months in a year.',
  ),
  Question(
    questionText: 'tree - fridge - table - bed',
    answerText: 'fridge',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is items typically found indoors.',
  ),
  Question(
    questionText: 'salad - carrot - tomato - cucumber',
    answerText: 'salad',
    difficulty: Difficulty.easy,
    hint:
        'The common theme in this question is vegetables found in a garden or kitchen.',
  ),
  Question(
    questionText: 'second - third - nine - twelfth',
    answerText: 'nine',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is ordinal counting.',
  ),
  Question(
    questionText: 'orange - cherry - potato - kiwi',
    answerText: 'potato',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is types of fruit.',
  ),
  Question(
    questionText: 'pencil - eraser - ruler - school',
    answerText: 'school',
    difficulty: Difficulty.easy,
    hint:
        'The common theme in this question is items commonly found in a classroom.',
  ),
  Question(
    questionText: 'sister - niece - father - aunt',
    answerText: 'father',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is female family relatives.',
  ),
  Question(
    questionText: 'grandfather - aunt - nephew - brother',
    answerText: 'aunt',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is male family relatives.',
  ),
  Question(
    questionText: 'windy - sunny - clock - freezing',
    answerText: 'clock',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is weather conditions.',
  ),
  Question(
    questionText: 'football - tennis - music - judo',
    answerText: 'music',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is types of activities or sports.',
  ),
  Question(
    questionText: 'red - jump - read - write',
    answerText: 'red',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is verbs.',
  ),
  Question(
    questionText: 'my - our - she - your',
    answerText: 'she',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is possessive pronouns.',
  ),
  Question(
    questionText: 'skirt - shirt - shoe - smart',
    answerText: 'smart',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is clothing items.',
  ),
  Question(
    questionText: 'car - dog - camel - horse',
    answerText: 'car',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is animals.',
  ),
  Question(
    questionText: 'arm - knee - finger - know',
    answerText: 'know',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is body parts.',
  ),
  Question(
    questionText: 'taxi - bus - underground - stop',
    answerText: 'stop',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is modes of transportation.',
  ),
  Question(
    questionText: 'ice-cream - cake - chips - biscuits',
    answerText: 'chips',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is snacks or desserts.',
  ),
  Question(
    questionText: 'bed - kitchen - bathroom - dining hall',
    answerText: 'bed',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is rooms in a house.',
  ),
  Question(
    questionText: 'cartoon - comedy - musical - office',
    answerText: 'office',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is types of TV shows or movies.',
  ),
  Question(
    questionText: 'long - short - old - door',
    answerText: 'door',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is  descriptive words.',
  ),
  Question(
    questionText: 'telephone - computer - radio - lamp',
    answerText: 'lamp',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is electronic devices.',
  ),
  Question(
    questionText: 'shivering - fever - headache - flu',
    answerText: 'flu',
    difficulty: Difficulty.easy,
    hint:
        'The common theme in this question is the common symptoms of diseases.',
  ),
  Question(
    questionText: 'malaria - chickenpox - diarrhea - dinner',
    answerText: 'dinner',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is diseases.',
  ),
  Question(
    questionText: 'beef - chicken - pork - meatball',
    answerText: 'meatball',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is types of meat.',
  ),
  Question(
    questionText: 'bus - bicycle - airplane - apple',
    answerText: 'apple',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is types of vehicles.',
  ),
  Question(
    questionText: 'breakfast - lunch - meal - dinner',
    answerText: 'meal',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is times of day for eating.',
  ),
  Question(
    questionText: 'biology - carpet - geography - maths',
    answerText: 'carpet',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is subjects studied in school.',
  ),
  Question(
    questionText: 'blind - deaf - mute - brand',
    answerText: 'brand',
    difficulty: Difficulty.easy,
    hint: 'The common theme in this question is disabilities.',
  )
];
