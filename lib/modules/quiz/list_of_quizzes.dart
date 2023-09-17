import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_learning/modules/quiz/quiz_screen.dart';
import 'package:e_learning/shared/components/constants/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/app_cubit/app_cubit.dart';
import '../../layout/app_cubit/app_states.dart';
import '../../models/list_of_quizzes_model.dart';

import '../../shared/components/custom_widgets/list_of_quizzes_component.dart';

class QuizzesListScreen extends StatelessWidget {
  const QuizzesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        late ListOfQuizzesModel model;
        return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Quizzes',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: dummyQuizzes
                      .map((e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ListOfQuizzesComponents(
                              title: e.title,
                              subTitle: e.description,
                              function: () {
                                navigateTo(context, QuizScreen());
                              },
                            ),
                          ))
                      .toList(),
                ),
              ]))),
        );
      },
    );
  }
}
