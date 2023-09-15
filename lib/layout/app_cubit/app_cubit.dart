import 'package:bloc/bloc.dart';
import 'package:e_learining/models/list_of_videos_model.dart';
import 'package:e_learining/modules/chat/online_users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/lesson_details/list_of_lessons.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const Center(child: Text('Home')),
    const VideoListScreen(),
    const Center(child: Text('Quiz')),
    const ChatScreen(),
    const Center(child: Text('Settings')),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  ListOfVideosModel? listOfVideosModel;
  Map<int, bool> videos = {};

  void getListOfAllVideos() {
    emit(ListOfAllVideosLoadingState());
    DioHelper.getData(
      url: AppEndPoints.videos,
    ).then((value) {
      listOfVideosModel = ListOfVideosModel.fromJson(value.data);
      print(listOfVideosModel!.data![1].title);
      emit(ListOfAllVideosSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ListOfAllVideosErrorState());
    });
  }
}
