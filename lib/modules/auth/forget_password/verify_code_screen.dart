import 'package:e_learining/modules/auth/login/login_cubit/cubit.dart';
import 'package:e_learining/modules/auth/login/login_cubit/states.dart';
import 'package:e_learining/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/custom_widgets/custom_text_form_field.dart';
import '../../../shared/components/custom_widgets/custom_toast.dart';
import '../../../shared/components/custom_widgets/main_button.dart';
import '../../../shared/network/local/shared_preferences_helper.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/info-circle.svg',
                          height: 75, color: AppColors.mainColor),
                      const SizedBox(height: 24),
                      Text(
                        'Verification',
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'We have send you a code to verify your email address.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      OtpTextField(
                        numberOfFields: 5,
                        fieldWidth: 57,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderColor: AppColors.mainColor,
                        showFieldAsBox: true,
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        onCodeChanged: (String code) {
                          //TODO handle validation or checks here
                        },
                        onSubmit: (String verificationCode) {
                          //TODO check code and navigate to change password screen
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      MainButton(
                        width: double.infinity,
                        radius: 32.0,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                          } else {
                            showToast(
                              message: 'Please Enter Your Email',
                              state: ToastStates.error,
                            );
                          }
                        },
                        text: 'Continue',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
