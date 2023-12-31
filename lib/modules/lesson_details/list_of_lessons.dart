import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/app_cubit/app_cubit.dart';
import '../../layout/app_cubit/app_states.dart';
import '../../models/list_of_videos_model.dart';
import '../../shared/components/custom_widgets/lesson_component.dart';
import 'lesson_details.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ListOfVideosModel? model = AppCubit.get(context).listOfVideosModel;
        return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Lessons',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                ConditionalBuilder(
                    condition: state is! ListOfAllVideosLoadingState,
                    builder: (context) => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => VideComponent(
                              title: model.data![index].title!,
                              subTitle: model.data![index].description!,
                              thumbnailImage: 'assets/images/teacher_online.jpg',
                              function: () {
                                print('Hello');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPlayersScreen(
                                        videoData: model.data![index]),
                                  ),
                                );
                              },
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 5,
                            ),
                        itemCount: model!.data!.length),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator())),
              ]))),
        );
      },
    );
  }
}
