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
  final List<DepartmentLessonModel> lessonList;

  DepartmentModel({required this.lessonList});

  factory DepartmentModel.fromDepartmentFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? videosList = snapshot.data()?['videos'];
    if (videosList == null) {
      return DepartmentModel(lessonList: []);
    }
    List<DepartmentLessonModel> videos = videosList.map((videoMap) {
      return DepartmentLessonModel(
        videoName: videoMap['videoname'] as String,
        videoUrl: videoMap['videourl'] as String,
        date: videoMap['date'] as String,
        imageURL: videoMap['imageURL'] as String,
      );
    }).toList();
    return DepartmentModel(lessonList: videos);
  }
}

class DepartmentLessonModel {
  final String videoName;
  final String videoUrl;
  final String imageURL;
  final String? date;

  DepartmentLessonModel({
    required this.videoName,
    required this.videoUrl,
    required this.imageURL,
    this.date,
  });
}
