import '../../../../models/register_model.dart';

abstract class AppLoginStates {}

class AppRegisterInitialState extends AppLoginStates {}

class AppRegisterLoadingState extends AppLoginStates {}

class AppRegisterSuccessState extends AppLoginStates {
  final AppRegisterModel registerModel;

  AppRegisterSuccessState(this.registerModel);
}

class AppRegisterErrorState extends AppLoginStates {
  final String error;

  AppRegisterErrorState(this.error);
}

class AppRegisterChangePasswordVisibilityState extends AppLoginStates {}
class AppRegisterChangeGenderState extends AppLoginStates {
}