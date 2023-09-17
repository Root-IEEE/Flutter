import 'package:e_learning/layout/layout.dart';
import 'package:e_learning/modules/quiz/controllers/question_controller.dart';
import 'package:e_learning/shared/components/constants/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../shared/components/custom_widgets/main_button.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/tick-circle.svg'),
              const SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'Congratulations! ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text:
                            'you passed\nwith score of "${qnController.correctAns * 10}/${qnController.questions.length * 10}"',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MainButton(
                  width: double.infinity,
                  radius: 32.0,
                  onTap: () {
                    navigateTo(context, const AppLayout());
                  },
                  text: 'Back to home',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
