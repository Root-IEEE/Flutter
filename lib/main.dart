import 'package:e_learining/modules/auth/login/login_screen.dart';
import 'package:e_learining/shared/components/constants/bloc_observer.dart';
import 'package:e_learining/shared/network/local/shared_preferences_helper.dart';
import 'package:e_learining/shared/network/remote/dio_helper.dart';
import 'package:e_learining/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'layout/app_cubit/app_cubit.dart';
import 'layout/home.dart';
import 'modules/onboarding/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  Widget? widget;
  bool? isBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');

  if (isBoarding != null) {
    if (token != null) {
      widget = const AppLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }

  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  // final bool isDark;
  final Widget? startWidget;

  const MyApp(
      {Key? key,
      // required this.isDark,
      required this.startWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey.shade200,
            brightness: Brightness.light,
            primarySwatch: AppColors.mainColor,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            tabBarTheme: TabBarTheme(
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              unselectedLabelColor: Colors.grey,
              labelColor: AppColors.mainColor,
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          home: startWidget,
        ));
  }
}
