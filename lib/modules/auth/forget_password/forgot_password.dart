import 'package:e_learning/modules/auth/forget_password/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/components/constants/navigation_helper.dart';
import '../../../shared/components/custom_widgets/custom_appbar_icon.dart';
import '../../../shared/components/custom_widgets/custom_text_form_field.dart';
import '../../../shared/components/custom_widgets/custom_toast.dart';
import '../../../shared/components/custom_widgets/main_button.dart';
import '../../../shared/styles/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: CustomIconButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/images/sms-tracking.svg',
                          height: 75, color: AppColors.mainColor),
                      const SizedBox(height: 24),
                      Text(
                        'Forget Password?',
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
                        'Please enter your email so we can send you a verification code.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      DefaultTextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                        },
                        labelText: 'Enter Your Email',
                        prefixIcon: SvgPicture.asset('assets/icons/sms.svg'),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      MainButton(
                        width: double.infinity,
                        radius: 32.0,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            navigateTo(context, VerifyCodeScreen());
                          } else {
                            showToast(
                              message: 'Please Enter Your Email',
                              state: ToastStates.error,
                            );
                          }
                        },
                        text: 'Send Reset Code',
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
