import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'package:video_player/video_player.dart';

import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';

class LessonVideo extends StatefulWidget {
  const LessonVideo({
    Key? key,
    required this.videoUrl,
    required this.videoTitle,
  }) : super(key: key);

  final String videoUrl;
  final String videoTitle;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<LessonVideo> {
  @override
  Widget build(BuildContext context) {
    bool fullscreen = false;
    return Scaffold(
      appBar: fullscreen ? null : CustomAppbar(title: 'Eğitim Video'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child: YoYoPlayer(
                aspectRatio: 16 / 9,
                url: widget.videoUrl,
                videoStyle: VideoStyle(
                  progressIndicatorColors: VideoProgressColors(
                    playedColor: TobetoAppColor.selecetedItemColor,
                    backgroundColor: Colors.black.withOpacity(0.3),
                  ),
                  qualityStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                          ),
                  forwardAndBackwardBtSize:
                      MediaQuery.of(context).size.width * 0.05,
                  actionBarBgColor: Colors.black.withOpacity(0.3),
                  actionBarPadding: EdgeInsets.zero,
                  forwardIcon: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.035,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    child: Icon(
                      Icons.forward_10,
                      color: Theme.of(context).colorScheme.background,
                      size: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                  backwardIcon: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.035,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    child: Icon(
                      Icons.replay_10,
                      color: Theme.of(context).colorScheme.background,
                      size: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                  playIcon: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.045,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Theme.of(context).colorScheme.background,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ),
                  pauseIcon: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.045,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    child: Icon(
                      Icons.pause,
                      color: Theme.of(context).colorScheme.background,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ),
                  videoQualityPadding: EdgeInsets.all(4.0),
                ),
                videoLoadingStyle: const VideoLoadingStyle(
                  loading: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Loading video..."),
                      ],
                    ),
                  ),
                ),
                onFullScreen: (value) {
                  setState(() {
                    if (fullscreen != value) {
                      fullscreen = value;
                    }
                  });
                },
              ),
            ),
            // Video Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.videoTitle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            // Interaction Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_down),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.save_alt),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
