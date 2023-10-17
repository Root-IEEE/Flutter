import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../layout/layout.dart';
import '../../models/questions_model.dart';
import '../../shared/components/constants/navigation_helper.dart';
import '../../shared/components/custom_widgets/main_button.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: score > questions.length / 2
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/tick-circle.svg',
                      height: 100.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15.sp),
                          children: [
                            TextSpan(
                              text: 'Congratulations! ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 20.sp,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  'you passed\nwith score of "${score * 10}/${questions.length * 10}"',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MainButton(
                        width: double.infinity,
                        radius: 32.0.r,
                        onTap: () {
                          navigateTo(context, const AppLayout());
                        },
                        text: 'Back to home',
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/fail.svg',
                      height: 100.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15.sp),
                          children: [
                            TextSpan(
                              text: 'Sorry',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 20.sp,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  ', you didn’t pass the exam\n cause your score is "${score * 10}"',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MainButton(
                        width: double.infinity,
                        radius: 32.0.r,
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
