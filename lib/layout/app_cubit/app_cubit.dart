import 'package:e_learning/models/list_of_quizzes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/list_of_videos_model.dart';
import '../../modules/chat/online_users_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/lesson_details/list_of_lessons.dart';
import '../../modules/quiz/list_of_quizzes.dart';
import '../../modules/user/user_screen.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const VideoListScreen(),
    const QuizzesListScreen(),
    const ChatScreen(),
    const UserScreen(),
  ];

  List<String> data = [
    'assets/icons/3dcubeIcons.svg',
    'assets/icons/video-playIcons.svg',
    'assets/icons/clipboard-textIcons.svg',
    'assets/icons/messagesIcons.svg',
    'assets/icons/setting-2Icons.svg',
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

  ListOfQuizzesModel? listOfQuizzesModel;

  void getListOfAllQuizzes() {
    emit(ListOfAllQuizzesLoadingState());
    DioHelper.getData(
      url: AppEndPoints.quizzes,
    ).then((value) {
      listOfQuizzesModel = ListOfQuizzesModel.fromJson(value.data);
      emit(ListOfAllQuizzesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ListOfAllQuizzesErrorState());
    });
  }
}
