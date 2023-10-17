class Question {
  final String question;
  bool isLocked;
  final List<Option> options;
  Option? selectedOption;

  Question({
    required this.question,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String answer;
  final bool isCorrect;

  Option({
    required this.answer,
    required this.isCorrect,
  });
}

final questions = [
  Question(
      question:
          'Flutter is an open-source UI software development kit created by ______',
      options: [
        Option(
          answer: 'Apple',
          isCorrect: false,
        ),
        Option(
          answer: 'Google',
          isCorrect: true,
        ),
        Option(
          answer: 'Facebook',
          isCorrect: false,
        ),
        Option(
          answer: 'Microsoft',
          isCorrect: false,
        ),
      ]),
  Question(question: 'When google release Flutter.', options: [
    Option(
      answer: 'Sep 2017',
      isCorrect: false,
    ),
    Option(
      answer: 'Jun 2017',
      isCorrect: false,
    ),
    Option(
      answer: 'May 2017',
      isCorrect: true,
    ),
    Option(
      answer: 'May 2018',
      isCorrect: false,
    ),
  ]),
  Question(
      question: 'A memory location that holds a single letter or number.',
      options: [
        Option(
          answer: 'Double',
          isCorrect: false,
        ),
        Option(
          answer: 'Int',
          isCorrect: false,
        ),
        Option(
          answer: 'Char',
          isCorrect: true,
        ),
        Option(
          answer: 'Word',
          isCorrect: false,
        ),
      ]),
  Question(
      question: 'A memory location that holds a single letter or number.',
      options: [
        Option(
          answer: 'Cin',
          isCorrect: false,
        ),
        Option(
          answer: 'Count>>',
          isCorrect: false,
        ),
        Option(
          answer: 'Cout',
          isCorrect: true,
        ),
        Option(
          answer: 'Output>>',
          isCorrect: false,
        ),
      ]),
];
