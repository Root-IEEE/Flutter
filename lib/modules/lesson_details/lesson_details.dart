import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../shared/components/custom_widgets/video_player.dart';

class VideoPlayersScreen extends StatelessWidget {
  const VideoPlayersScreen({Key? key}) : super(key: key);

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
              const VideoPlayerView(
                url:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
                dataSourceType: DataSourceType.network,
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
                child: const TabBarView(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Description',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),

                    Align(
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
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Comments',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
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
