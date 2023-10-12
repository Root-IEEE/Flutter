import 'package:device_preview/device_preview.dart';
import 'package:e_learning/shared/components/constants/bloc_observer.dart';
import 'package:e_learning/shared/network/local/shared_preferences_helper.dart';
import 'package:e_learning/shared/network/remote/dio_helper.dart';
import 'package:e_learning/shared/styles/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'layout/app_cubit/app_cubit.dart';
import 'layout/layout.dart';
import 'modules/auth/login/login_screen.dart';
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
    widget = const OnBoardingScreen();
  }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(
        startWidget: widget,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp(
      {Key? key,
      // required this.isDark,
      required this.startWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getListOfAllVideos(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey.shade200,
            brightness: Brightness.light,
            primarySwatch: AppColors.mainColor,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey.shade200,
                iconTheme: const IconThemeData(color: Colors.black)),
            tabBarTheme: TabBarTheme(
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              unselectedLabelColor: Colors.grey,
              labelColor: AppColors.mainColor,
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          home: startWidget,
        ),
      ),
    );
  }
}
