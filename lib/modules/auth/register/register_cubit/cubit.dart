import 'package:e_learining/modules/auth/register/register_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/register_model.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';


class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppRegisterInitialState());
  AppRegisterModel? registerModel;

  static AppLoginCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(AppRegisterLoadingState());

    DioHelper.postData(
      url: AppEndPoints.REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      print(value.data);
      registerModel = AppRegisterModel.fromJson(value.data);
      emit(AppRegisterSuccessState(registerModel!));

    }).catchError((error) {
      print('YOUR ERROR: ${error.toString()}');
      emit(AppRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AppRegisterChangePasswordVisibilityState());
  }


  String? gender ;
  void selectGender(String newGender) {
    gender = newGender;
    emit(AppRegisterChangeGenderState());

  }
}
