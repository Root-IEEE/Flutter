import 'package:bloc/bloc.dart';
import 'package:e_learning/modules/auth/register/register_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/register_model.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());
  AppRegisterModel? registerModel;

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) {
    emit(AppRegisterLoadingState());

    DioHelper.postData(
      url: AppEndPoints.REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    ).then((value) {
      print(value.data);
      registerModel = AppRegisterModel.fromJson(value.data);
      emit(AppRegisterSuccessState(registerModel!));
    }).catchError((error) {
      print('ERROR : ${error.toString()}');
      emit(AppRegisterErrorState(error.toString()));
    });
  }

  Widget suffix = SvgPicture.asset('assets/icons/eye.svg');
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? SvgPicture.asset('assets/icons/eye.svg')
        : SvgPicture.asset('assets/icons/eye-slash.svg');
    emit(AppRegisterChangePasswordVisibilityState());
  }

  String? gender;

  void selectGender(String newGender) {
    gender = newGender;
    emit(AppRegisterChangeGenderState());
  }
}
