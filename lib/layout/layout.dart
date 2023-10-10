import 'package:e_learning/shared/components/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';

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
          extendBody: true,
          body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: [
              cubit.bottomScreens[cubit.currentIndex],
              CustomBottomNavigationBar(
                data: cubit.data,
                currentIndex: cubit.currentIndex,
                onTap: (int index) {
                  cubit.changeBottom(index);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
