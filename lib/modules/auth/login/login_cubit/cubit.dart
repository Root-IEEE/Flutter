import 'package:e_learining/modules/auth/login/login_cubit/states.dart';
import 'package:e_learining/shared/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/login_model.dart';
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
      print('YOUR FUCKIN STUPID ERROR : ${error.toString()}');
      emit(AppLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AppChangePasswordVisibilityState());
  }
}
