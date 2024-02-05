import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
/* class DepartmentModel {
  String videoInfo;
  DepartmentModel({required this.videoInfo});

  factory DepartmentModel.fromDepartmentFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return DepartmentModel(
      videoInfo: map['videos'] as String,
    );
  }
} */
class DepartmentModel {
  final List<DepartmentVideoModel> videos;

  DepartmentModel({required this.videos});

  factory DepartmentModel.fromDepartmentFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? videosList = snapshot.data()?['videos'];
    if (videosList == null) {
      return DepartmentModel(videos: []);
    }
    List<DepartmentVideoModel> videos = videosList.map((videoMap) {
      return DepartmentVideoModel(
        videoName: videoMap['videoname'] as String,
        videoUrl: videoMap['videourl'] as String,
        date: videoMap['date'] as String,
      );
    }).toList();
    return DepartmentModel(videos: videos);
  }
}

class DepartmentVideoModel {
  final String videoName;
  final String videoUrl;
  final String? date;

  DepartmentVideoModel(
      {required this.videoName, required this.videoUrl, this.date});
}
