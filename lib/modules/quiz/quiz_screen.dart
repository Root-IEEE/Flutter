import 'package:e_learning/shared/components/custom_widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/styles/colors.dart';
import 'components/progress_bar.dart';
import 'components/question_card.dart';
import 'controllers/question_controller.dart';

class QuizScreen extends StatelessWidget {
  QuestionController questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: kSecondaryColor, fontSize: 20),
                      children: [
                        TextSpan(
                          text: "/${questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: kSecondaryColor, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              SizedBox(
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: PageView.builder(
                    // Block swipe to the next question
                    physics: const NeverScrollableScrollPhysics(),
                    controller: questionController.pageController,
                    onPageChanged: questionController.updateTheQnNum,
                    itemCount: questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                        question: questionController.questions[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
