import 'package:e_learning/modules/auth/login/login_screen.dart';
import 'package:e_learning/modules/auth/register/register_cubit/cubit.dart';
import 'package:e_learning/modules/auth/register/register_cubit/states.dart';
import 'package:e_learning/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/components/constants/navigation_helper.dart';
import '../../../shared/components/custom_widgets/custom_text_form_field.dart';
import '../../../shared/components/custom_widgets/custom_toast.dart';
import '../../../shared/components/custom_widgets/main_button.dart';
import '../../../shared/network/local/shared_preferences_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  String? selectedGender;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener: (context, state) {
          try {
            if (state is AppRegisterSuccessState) {
              print(state.registerModel.token);
              final token = state.registerModel.token;
              CacheHelper.saveData(
                key: 'token',
                value: token,
              ).then((value) {
                navigateToAndKill(context, LoginScreen());
                print(CacheHelper.getData(key: 'token'));
              });
            } else if (state is AppRegisterErrorState) {
              showToast(
                message: 'Already have an account',
                state: ToastStates.error,
              );
            }
          } catch (error) {
            debugPrint(error.toString());
          }
        },
        builder: (context, state) {
          var cubit = AppRegisterCubit.get(context);
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
                                child: Image.asset(
                                  'assets/images/logo.png',
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Welcome!',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors.purpleGrey),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            DefaultTextField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                              },
                              labelText: 'Enter your name',
                              prefixIcon: const Icon(Icons.person_outline),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors.purpleGrey),
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
                              prefixIcon:
                                  SvgPicture.asset('assets/icons/sms.svg'),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors.purpleGrey),
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
                              prefixIcon:
                                  SvgPicture.asset('assets/icons/lock.svg'),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Confirm Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors.purpleGrey),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            DefaultTextField(
                              controller: passwordConfirmationController,
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
                              labelText: 'Confirm Password',
                              prefixIcon:
                                  SvgPicture.asset('assets/icons/lock.svg'),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Gender',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors.purpleGrey),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'Male',
                                  groupValue: cubit.gender,
                                  onChanged: (value) {
                                    cubit.selectGender(value!);
                                  },
                                ),
                                Text(
                                  'Male',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.purpleGrey),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Radio<String>(
                                  value: 'Female',
                                  groupValue: cubit.gender,
                                  onChanged: (value) {
                                    cubit.selectGender(value!);
                                  },
                                ),
                                Text(
                                  'Female',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.purpleGrey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            MainButton(
                              width: double.infinity,
                              radius: 32.0,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    passwordConfirmation:
                                        passwordConfirmationController.text,
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
                                Text('Already have an account?',
                                    style:
                                        Theme.of(context).textTheme.bodySmall!),
                                const SizedBox(
                                  width: 16,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 3,
                                          spreadRadius: 0.5,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        navigateTo(context, LoginScreen());
                                      },
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 50.0,
                            )
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
