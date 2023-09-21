import 'package:e_learning/modules/auth/login/login_screen.dart';
import 'package:e_learning/shared/components/constants/navigation_helper.dart';
import 'package:e_learning/shared/components/custom_widgets/main_button.dart';
import 'package:e_learning/shared/styles/colors.dart';
import 'package:flutter/material.dart';
class AcceptanceWaitingScreen extends StatelessWidget {
  const AcceptanceWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logoB.png',
                fit: BoxFit.cover,
                height: 50,
              ),
              const SizedBox(
                height: 64,
              ),
              Image.asset(
                'assets/images/wait_for_acceptance.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 24.0,
                        ),
                    children: [
                      const TextSpan(text: 'Your\t'),
                      TextSpan(
                          text: 'request\t',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: AppColors.mainColor,
                                    fontSize: 24.0,
                                  )),
                      const TextSpan(
                          text: 'for\nregistration has been\nsubmitted\t'),
                      TextSpan(
                          text: 'successfully',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: AppColors.mainColor,
                                    fontSize: 24.0,
                                  )),
                    ]),
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                textAlign: TextAlign.start,
                softWrap: true,
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                    children: [
                      const TextSpan(
                          text:
                              'Please wait for your activation so you can login successfully, it won\'t take long, we will send you a confirmation email to\n'),
                      TextSpan(
                          text: 'mariam.osama.eisa@gmail.com.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                    ]),
              ),
              const SizedBox(
                height: 24,
              ),
              MainButton(
                text: 'Back To Sign in ',
                width: double.infinity,
                onTap: () {
                  navigateTo(context, LoginScreen());
                },
                radius: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
