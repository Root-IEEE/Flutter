import 'package:e_learning/modules/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../network/local/shared_preferences_helper.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateToAndKill(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

void singOut(context) {
  CacheHelper.removeData(
    key: 'token',
  )!
      .then((value) {
    if (value) {
      navigateToAndKill(context, LoginScreen());
    }
  });
}
