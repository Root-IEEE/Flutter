import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../layout/layout.dart';
import '../../../shared/components/constants/navigation_helper.dart';
import '../../../shared/components/custom_widgets/custom_text_form_field.dart';
import '../../../shared/components/custom_widgets/custom_toast.dart';
import '../../../shared/components/custom_widgets/main_button.dart';
import '../../../shared/network/local/shared_preferences_helper.dart';
import '../forget_password/forgot_password.dart';
import '../register/register_screen.dart';
import 'login_cubit/cubit.dart';
import 'login_cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {
          try {
            if (state is AppLoginSuccessState) {
              showToast(
                message: 'Login Successfully',
                state: ToastStates.success,
              );

              final token = state.loginModel.token;
              CacheHelper.saveData(
                key: 'token',
                value: token,
              ).then((value) {
                navigateToAndKill(context, const AppLayout());
                print(CacheHelper.getData(key: 'token'));
              });
            } else if (state is AppLoginErrorState) {
              showToast(
                message: 'Wrong Email or Password!',
                state: ToastStates.error,
              );
            }
          } catch (error) {
            debugPrint(error.toString());
          }
        },
        builder: (context, state) {
          var cubit = AppLoginCubit.get(context);
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Welcome Back!',
                                style: GoogleFonts.poppins().copyWith(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Align(
                                alignment: Alignment.topCenter,
                                child: RichText(
                                  text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(fontSize: 15),
                                      children: [
                                        const TextSpan(
                                            text: 'Sign in now to join '),
                                        TextSpan(
                                          text: 'UR PROF.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 15,
                                              ),
                                        ),
                                      ]),
                                )),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 15),
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
                              labelText: 'Email Address',
                              prefixIcon: Icons.email,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            DefaultTextField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: cubit.suffix,
                              onFieldSubmitted: (value) {},
                              isPassword: cubit.isPassword,
                              suffixPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'password is too short';
                                }
                              },
                              labelText: 'Password',
                              prefixIcon: Icons.lock_outline,
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      navigateTo(
                                          context, ForgetPasswordScreen());
                                    },
                                    child: const Text('Forget password?'))),
                            MainButton(
                              width: double.infinity,
                              radius: 32.0,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                } else {
                                  showToast(
                                    message: 'Please fill in all fields',
                                    state: ToastStates.error,
                                  );
                                }
                              },
                              text: 'Sign In',
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 15),
                                ),
                                TextButton(
                                    onPressed: () {
                                      navigateTo(context, RegisterScreen());
                                    },
                                    child: const Text('Sign Up'))
                              ],
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
        },
      ),
    );
  }
}
