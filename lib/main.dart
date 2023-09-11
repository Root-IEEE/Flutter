import 'package:bloc/bloc.dart';
import 'package:e_learining/modules/auth/register/register_screen.dart';
import 'package:e_learining/shared/components/constants/bloc_observer.dart';
import 'package:e_learining/shared/network/local/shared_preferences_helper.dart';
import 'package:e_learining/shared/network/remote/dio_helper.dart';
import 'package:e_learining/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modules/auth/register/register_cubit/cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppRegisterCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: AppColors.mainColor,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: RegisterScreen(),
        ));
  }
}
