import 'package:e_learning/models/questions_model.dart';
import 'package:e_learning/modules/quiz/quiz_cubit/quiz_cubit.dart';
import 'package:e_learning/modules/quiz/result_screen.dart';
import 'package:e_learning/shared/components/constants/navigation_helper.dart';
import 'package:e_learning/shared/components/custom_widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/components/custom_widgets/custom_timer.dart';
import '../../shared/styles/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _controller;
  late QuizCubit cubit;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    cubit = QuizCubit(); // Initialize the cubit here.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<QuizCubit, QuizState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 155.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(67.r))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Exam 1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                CountdownTimerWidget(
                                  duration: const Duration(minutes: 1),
                                  onTimerComplete: () {
                                    navigateTo(context, ResultScreen(score: cubit.score));
                                  },
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  ' MINS - Time Left',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, bottom: 10, top: 20),
                    child: Text(
                      'Question ${cubit.questionNumber}:',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: PageView.builder(
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        final question = questions[index];
                        return _buildQuestion(question);
                      },
                    ),
                  ),
                ),
                cubit.isLocked
                    ? Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20.0, right: 20.0),
                        child: MainButton(
                          radius: 26.r,
                          width: 100.w,
                          text: cubit.questionNumber < questions.length
                              ? 'Next'
                              : 'Submit',
                          onTap: () {
                            if (cubit.questionNumber < questions.length) {
                              cubit.navigateToNextQuestion();
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInExpo,
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    score: cubit.score,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.question,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: OptionWidget(
            question: question,
            onClickedOption: (option) {
              cubit.onOptionClicked(question: question, option: option);
            },
          ),
        ),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  OptionWidget({
    required this.question,
    required this.onClickedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.options
          .map(
            (option) => _buildOption(context, option),
          )
          .toList(),
    );
  }

  Widget _buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () {
        onClickedOption(option);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.answer,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )),
            getIconForOption(option, question),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.check_circle,
                color: Colors.red,
              );
      } else if (option.isCorrect) {
        return const Icon(
          Icons.cancel,
          color: Colors.green,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
