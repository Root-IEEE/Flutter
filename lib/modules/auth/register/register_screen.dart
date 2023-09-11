import 'package:e_learining/modules/auth/register/register_cubit/cubit.dart';
import 'package:e_learining/modules/auth/register/register_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/components/constants/constants.dart';
import '../../../shared/components/custom_widgets/custom_text_form_field.dart';
import '../../../shared/components/custom_widgets/custom_toast.dart';
import '../../../shared/components/custom_widgets/main_button.dart';
import '../../../shared/network/local/shared_preferences_helper.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  String? selectedGender;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener: (context, state) {
          if (state is AppRegisterSuccessState) {
            if (state.registerModel.status!) {
              print(state.registerModel.message);
              print(state.registerModel.data!.token);

              CacheHelper.saveData(
                key: 'token',
                value: state.registerModel.data!.token,
              ).then((value) {
                token = state.registerModel.data!.token!;
              });
            } else {
              print(state.registerModel.message);

              showToast(
                message: state.registerModel.message!,
                state: ToastStates.error,
              );
            }
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
                              child: Text(
                                'Welcome!',
                                style: GoogleFonts.poppins().copyWith(
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
                                  .bodySmall!
                                  .copyWith(fontSize: 15),
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
                              prefixIcon: Icons.person_outline,
                            ),
                            const SizedBox(
                              height: 15.0,
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
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Phone',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            DefaultTextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                              },
                              labelText: 'Phone',
                              prefixIcon: Icons.phone,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Gender',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 15),
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
                                const Text('Male'),
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
                                const Text('Female'),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            MainButton(
                              width: double.infinity,
                              radius: 32.0,
                              onTap: () {
                                if (formKey.currentState!.validate() &&
                                    selectedGender != null &&
                                    isSelected) {
                                  cubit.userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    // gender: selectedGender!,
                                  );
                                } else {
                                  showToast(
                                    message: 'Please fill in all fields',
                                    state: ToastStates.error,
                                  );
                                }
                              },
                              text: 'Sign Up',
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 15),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('Sign in'))
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
