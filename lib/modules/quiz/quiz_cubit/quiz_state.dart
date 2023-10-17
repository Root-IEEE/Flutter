part of 'quiz_cubit.dart';

abstract class QuizState {}

class QuizInitialState extends QuizState {}

class NextQuestionNavigationState extends QuizState {}

class OnOptionClickedState extends QuizState {}

class EndTimerState extends QuizState {}
