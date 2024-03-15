import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/models/watched_video_model.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/screens/menu/profile/skills.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:video_player/video_player.dart';

class LessonVideo extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;

  const LessonVideo({
    Key? key,
    required this.videoUrl,
    required this.videoTitle,
  }) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<LessonVideo> {
  late VideoPlayerController _controller;
  bool _isControlVisible = false;
  bool _isMuted = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !_isFullScreen ? CustomAppbar(title: 'Eğitim Video') : null,
      body: SingleChildScrollView(
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoaded) {
          return _buildVideoPlayer(context, state.watchedVideos);
        } else {
          return CircularProgressIndicator();
        }
      })

          //  Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Stack(
          //       children: [
          //         // Video oynatıcı ve kontrolleri
          //         GestureDetector(
          //           onTap: () =>
          //               setState(() => _isControlVisible = !_isControlVisible),
          //           child: Stack(
          //             alignment: Alignment.bottomCenter,
          //             children: [
          //               _controller.value.isInitialized
          //                   ? AspectRatio(
          //                       aspectRatio: _controller.value.aspectRatio,
          //                       child: VideoPlayer(_controller),
          //                     )
          //                   : Center(child: CircularProgressIndicator()),
          //               _isControlVisible
          //                   ? _videoControls(context)
          //                   : SizedBox.shrink(),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       height: 16,
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(left: ProjectUtilities.sizeWidth_8),
          //       child: Text(
          //         widget.videoTitle,
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          //         textAlign: TextAlign.start,
          //       ),
          //     )
          //   ],
          // ),
          ),
    );
  }

  Widget _buildVideoPlayer(
      BuildContext context, List<WatchedVideo>? watchedVideos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () =>
                  setState(() => _isControlVisible = !_isControlVisible),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Center(child: CircularProgressIndicator()),
                  _isControlVisible
                      ? _videoControls(context)
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.only(left: ProjectUtilities.sizeWidth_8),
          child: Text(
            widget.videoTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }

  Widget _videoControls(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isControlVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: Container(
        color: Colors.black45,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.replay_10),
              color: Colors.white,
              onPressed: () => _controller
                  .seekTo(_controller.value.position - Duration(seconds: 10)),
            ),
            IconButton(
              icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
            ),
            IconButton(
              icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _isMuted = !_isMuted;
                  _controller.setVolume(_isMuted ? 0 : 1);
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.forward_10),
              color: Colors.white,
              onPressed: () => _controller
                  .seekTo(_controller.value.position + Duration(seconds: 10)),
            ),
            IconButton(
              icon: Icon(Icons.fullscreen),
              color: Colors.white,
              onPressed: _toggleFullScreen,
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFullScreen() {
    setState(() {
      if (_isFullScreen &&
          MediaQuery.of(context).orientation == Orientation.landscape) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      }
      _isFullScreen = !_isFullScreen;
      //merhaba
    });

    if (_controller.value.isPlaying &&
        _controller.value.position.inMilliseconds == 0) {
      final List<WatchedVideo> watchedVideos = [
        WatchedVideo(isWatched: true, videoID: 'hey')
      ];
      BlocProvider.of<UserBloc>(context)
          .add(UpdateWatchedVideos(watchedVideos: watchedVideos));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
