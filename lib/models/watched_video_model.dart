class WatchedVideo {
  String videoID;
  bool isWatched;

  WatchedVideo({
    required this.videoID,
    required this.isWatched,
  });

  factory WatchedVideo.fromJson(Map<String, dynamic> json) {
    return WatchedVideo(
      videoID: json['videoID'] as String,
      isWatched: json['isWatched'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videoID': videoID,
      'isWatched': isWatched,
    };
  }
}
