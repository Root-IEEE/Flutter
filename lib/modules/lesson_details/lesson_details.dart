import 'package:flutter/material.dart';
import 'package:vimeo_video_player_custom/vimeo_video_player_custom.dart';
import '../../models/comment_model.dart';
import '../../models/list_of_videos_model.dart';
import '../../shared/components/custom_widgets/comment_component.dart';

class VideoPlayersScreen extends StatefulWidget {
  final Data videoData;

  const VideoPlayersScreen({super.key, required this.videoData});

  @override
  State<VideoPlayersScreen> createState() => _VideoPlayersScreenState();
}

class _VideoPlayersScreenState extends State<VideoPlayersScreen> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VimeoVideoPlayer(
                url: widget.videoData.video!,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 18.0, left: 24, bottom: 18.0),
                child: Text(
                  widget.videoData.title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 50,
                  child: Material(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: const TabBar(
                      tabs: [
                        Tab(
                          icon: Center(
                            child: Text(
                              'Description',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        Tab(
                          icon: Center(
                            child: Text(
                              'Quiz',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        Tab(
                          icon: Center(
                            child: Text(
                              'Comments',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                      indicatorWeight: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: TabBarView(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          widget.videoData.description!,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Quiz',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: dummyComments
                            .map((e) => CommentComponent(
                                  title: e.title,
                                  subTitle: e.subTitle,
                                  image: e.image,
                                  date: e.date,
                                ))
                            .toList()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
