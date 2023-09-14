import 'package:e_learining/layout/app_cubit/app_cubit.dart';
import 'package:e_learining/layout/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/styles/colors.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    elevation: 0, // Remove BottomNavigationBar's default shadow
                    selectedItemColor: AppColors.mainColor,
                    showSelectedLabels: false,
                    unselectedItemColor: Colors.grey,
                    onTap: (index) {
                      cubit.changeBottom(index);
                    },
                    currentIndex: cubit.currentIndex,
                    items: [
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/3dcubeIcons.svg',
                          height: 25,
                          width: 25,
                        ),
                        label: 'Home',
                        activeIcon: SvgPicture.asset(
                          'assets/icons/3dcubeIcons.svg',
                          color: AppColors.mainColor,
                          height: 27,
                          width: 27,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/video-playIcons.svg',
                          height: 25,
                          width: 25,
                        ),
                        label: 'Lesson',
                        activeIcon: SvgPicture.asset(
                          'assets/icons/video-playIcons.svg',
                          color: AppColors.mainColor,
                          height: 27,
                          width: 27,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/clipboard-textIcons.svg',
                          height: 25,
                          width: 25,
                        ),
                        label: 'Quiz',
                        activeIcon: SvgPicture.asset(
                          'assets/icons/clipboard-textIcons.svg',
                          color: AppColors.mainColor,
                          height: 27,
                          width: 27,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/messagesIcons.svg',
                          height: 25,
                          width: 25,
                        ),
                        label: 'Chat',
                        activeIcon: SvgPicture.asset(
                          'assets/icons/messagesIcons.svg',
                          color: AppColors.mainColor,
                          height: 27,
                          width: 27,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/setting-2Icons.svg',
                          height: 25,
                          width: 25,
                        ),
                        label: 'Settings',
                        activeIcon: SvgPicture.asset(
                          'assets/icons/setting-2Icons.svg',
                          color: AppColors.mainColor,
                          height: 27,
                          width: 27,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
