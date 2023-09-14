import 'package:bloc/bloc.dart';
import 'package:e_learining/modules/chat/online_users_screen.dart';
import 'package:e_learining/modules/lesson_details/lesson_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const Center(child: Text('Home')),
    const VideoPlayersScreen(),
    const Center(child: Text('Quiz')),
    const ChatScreen(),
    const Center(child: Text('Settings')),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
