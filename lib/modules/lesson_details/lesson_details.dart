import 'package:e_learining/shared/components/custom_widgets/chat_component.dart';
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import '../../models/comment_model.dart';

class VideoPlayersScreen extends StatefulWidget {
  const VideoPlayersScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayersScreen> createState() => _VideoPlayersScreenState();
}

class _VideoPlayersScreenState extends State<VideoPlayersScreen> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(
        '518190130',
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
              PodVideoPlayer(
                controller: controller,
                videoAspectRatio: 16 / 9,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 18.0, left: 24, bottom: 18.0),
                child: Text(
                  'First Unit Second lesson',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Description',
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

                    // third tab bar view widget (Comments)
                    ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: dummyComments
                            .map((e) => ChatComponent(
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
