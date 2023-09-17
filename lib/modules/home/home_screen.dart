import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_learning/shared/components/constants/navigation_helper.dart';
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
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ListOfVideosModel? model = AppCubit.get(context).listOfVideosModel;

          return ConditionalBuilder(
            condition: state is! ListOfAllVideosLoadingState,
            builder: (context) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/Ahmed.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 16),
                                  children: [
                                    const TextSpan(text: 'Welcome,\n'),
                                    TextSpan(
                                      text: 'Ahmed Mahmoud',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ]),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/icons/notification-bing.svg',
                                  ),
                                )),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Continue learning',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 150,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                          const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                          child: Image.asset(
                                              'assets/images/Ahmed.jpg',
                                              height: 150,
                                              width: 150)),
                                      SvgPicture.asset(
                                          'assets/images/video_icon.svg'),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text(
                                            model!.data![1].title!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(fontSize: 16),
                                          ),
                                        ),
                                        Text(
                                          model.data![1].title!,
                                          softWrap: true,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(fontSize: 15),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Row(children: [
                                            Text(
                                              'Resume',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                  fontSize: 15,
                                                  color:
                                                  AppColors.mainColor,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            Icon(
                                              Icons.arrow_right,
                                              color: AppColors.mainColor,
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              navigateTo(
                                  context,
                                  VideoPlayersScreen(
                                    videoData: model.data![1],
                                  ));
                            },
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
                                    .bodyMedium!
                                    .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
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
                    ConditionalBuilder(
                      condition: model!.data!.isNotEmpty,
                      builder: (context) {
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => VideComponent(
                                  title: model.data![index].title!,
                                  subTitle: model.data![index].description!,
                                  thumbnailImage: 'assets/images/Ahmed.jpg',
                                  function: () {
                                    print('Hello');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            VideoPlayersScreen(
                                                videoData: model.data![index]),
                                      ),
                                    );
                                  },
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 5,
                                ),
                            itemCount: model.data!.length);
                      },
                      fallback: (context) {
                        // Handle the case when model is null or empty
                        return const Center(child: Text('No data available'));
                      },
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
}
