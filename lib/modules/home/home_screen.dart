import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_learning/shared/components/constants/navigation_helper.dart';
import 'package:e_learning/shared/components/custom_widgets/resume_video_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../layout/app_cubit/app_cubit.dart';
import '../../layout/app_cubit/app_states.dart';
import '../../models/list_of_videos_model.dart';
import '../../shared/components/custom_widgets/lesson_component.dart';
import '../../shared/styles/colors.dart';
import '../lesson_details/lesson_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double lastVideoProgress = 0.5;

    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ListOfVideosModel? model = AppCubit.get(context).listOfVideosModel;

          return ConditionalBuilder(
            condition: state is! ListOfAllVideosLoadingState,
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHomeCustomAppBar(context),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Continue Learning',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ResumeVideoCard(
                            imagePath: 'assets/images/teacher_online.jpg',
                            title: model!.data![1].title!,
                            lastVideoProgress: lastVideoProgress,
                            onTap: () {
                              navigateTo(
                                  context,
                                  VideoPlayersScreen(
                                    videoData: model.data![1],
                                  ));
                            },
                            cardHeight: 107,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Recent Lessons',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'See All',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            color: AppColors.mainColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => VideComponent(
                        title: model.data![index].title!,
                        subTitle: model.data![index].description!,
                        thumbnailImage: 'assets/images/teacher_online.jpg',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayersScreen(
                                videoData: model.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                      itemCount: model.data!.length,
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHomeCustomAppBar(BuildContext context) {
    return Row(children: [
      const CircleAvatar(
        backgroundImage: AssetImage(
          'assets/images/person.png',
        ),
        radius: 25,
      ),
      const SizedBox(
        width: 10,
      ),
      RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.purpleGrey),
            children: [
              const TextSpan(text: 'Welcome,\n'),
              TextSpan(
                text: 'Ahmed Mahmoud',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ]),
      ),
      const Spacer(),
      InkWell(
        onTap: () {},
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            'assets/icons/notification-bing.svg',
          ),
        ),
      ),
    ]);
  }
}
