import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(title: Text(widget.videoTitle)),
      body: Stack(
        children: [
          // Arkaplan resmi
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/video_image.png'), // Arkaplan resmi
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Video oynatıcı ve kontrolleri
          GestureDetector(
            onTap: () => setState(() => _isControlVisible = !_isControlVisible),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Center(child: CircularProgressIndicator()),
                _isControlVisible ? _videoControls(context) : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
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
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
