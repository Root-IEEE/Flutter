import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/questions_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitialState());

  static QuizCubit get(context) => BlocProvider.of(context);

  int questionNumber = 1;
  bool isLocked = false;
  int score = 0;

  void navigateToNextQuestion() {
    if (questionNumber < questions.length) {
      questionNumber++;
      isLocked = false;
      emit(NextQuestionNavigationState());
    }
  }

  void onOptionClicked({required Question question, required Option option}) {
    if (question.isLocked) {
      return;
    } else {
      question.isLocked = true;
      question.selectedOption = option;
      isLocked = question.isLocked;
      if (question.selectedOption!.isCorrect) {
        score++;
      }
    }
    emit(OnOptionClickedState());
  }

  bool isTimerRunning = true;

  void onTimerEnd() {
    isTimerRunning = false;
    emit(EndTimerState());
  }
}
