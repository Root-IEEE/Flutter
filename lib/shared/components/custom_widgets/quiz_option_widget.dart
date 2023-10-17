import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/questions_model.dart';

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionWidget({
    required this.question,
    required this.onClickedOption,
    Key? key, // Add Key parameter here
  }) : super(key: key);

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
        height: 50.h,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 12,
          bottom: 12,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36.r),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.answer,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
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
