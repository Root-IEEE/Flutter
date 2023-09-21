import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../layout/layout.dart';
import '../../../shared/components/constants/navigation_helper.dart';
import '../../../shared/components/custom_widgets/custom_text_form_field.dart';
import '../../../shared/components/custom_widgets/custom_toast.dart';
import '../../../shared/components/custom_widgets/main_button.dart';
import '../../layout/app_cubit/app_cubit.dart';
import '../../layout/app_cubit/app_states.dart';

class ChangeEmail extends StatelessWidget {
  ChangeEmail({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Change Email',
                          style: GoogleFonts.poppins().copyWith(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
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
                                  children: const [
                                    TextSpan(
                                        text:
                                            'Please enter your email so we can send you a verification code.'),
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
                          prefixIcon: SvgPicture.asset('assets/icons/sms.svg'),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MainButton(
                          width: double.infinity,
                          radius: 32.0,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              navigateTo(context, const AppLayout());
                            } else {
                              showToast(
                                message: 'Please fill in all fields',
                                state: ToastStates.error,
                              );
                            }
                          },
                          text: 'Change Email',
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
