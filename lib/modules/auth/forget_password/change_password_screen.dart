import 'package:e_learining/modules/auth/login/login_screen.dart';
import 'package:e_learining/shared/components/constants/navigation_helper.dart';
import 'package:e_learining/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/components/custom_widgets/custom_text_form_field.dart';
import '../../../shared/components/custom_widgets/custom_toast.dart';
import '../../../shared/components/custom_widgets/main_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var formKey = GlobalKey<FormState>();

  var newPasswordController = TextEditingController();

  var passwordController = TextEditingController();

  bool isPassword = true;

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
                      SvgPicture.asset('assets/images/security-safe.svg',
                          height: 75, color: AppColors.mainColor),
                      const SizedBox(height: 24),
                      Text(
                        'Reset Password ',
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
                        'Please enter your new password to continue.',
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
                          'Password',
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
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: isPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        onFieldSubmitted: (value) {},
                        isPassword: isPassword ? true : isPassword,
                        suffixPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        labelText: 'Enter your password',
                        prefixIcon: Icons.lock_outline,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirm Password',
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
                        controller: newPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: isPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        onFieldSubmitted: (value) {},
                        isPassword: isPassword ? true : isPassword,
                        suffixPressed: () {
                          setState(() {
                            isPassword != isPassword;
                          });
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        labelText: 'Confirm your password',
                        prefixIcon: Icons.lock_outline,
                      ),
                      const SizedBox(height: 20.0),
                      MainButton(
                        width: double.infinity,
                        radius: 32.0,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            navigateTo(context, LoginScreen());
                          } else {
                            showToast(
                              message: 'Please Enter Your Email',
                              state: ToastStates.error,
                            );
                          }
                        },
                        text: 'Reset Password',
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
