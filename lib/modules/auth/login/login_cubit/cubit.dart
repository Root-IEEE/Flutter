import 'package:e_learning/modules/auth/login/login_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../models/login_model.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());
  AppLoginModel? loginModel;

  static AppLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AppLoginLoadingState());

    DioHelper.postData(
      url: AppEndPoints.LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = AppLoginModel.fromJson(value.data!);
      emit(AppLoginSuccessState(loginModel!));
    }).catchError((error) {
      debugPrint('YOUR FUCKIN STUPID ERROR : ${error.toString()}');
      emit(AppLoginErrorState(error.toString()));
    });
  }

  Widget suffix = SvgPicture.asset('assets/icons/eye.svg');
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? SvgPicture.asset('assets/icons/eye.svg',)
        : SvgPicture.asset('assets/icons/eye-slash.svg');
    emit(AppChangePasswordVisibilityState());
  }
}
