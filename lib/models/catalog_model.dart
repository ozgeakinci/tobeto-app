import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogModel {
  final List<CatalogItem> lessonList;

  CatalogModel({required this.lessonList});

  factory CatalogModel.fromCatalogFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? videosList = snapshot.data()?['videos'];
    if (videosList == null) {
      return CatalogModel(lessonList: []);
    }
    List<CatalogItem> videos = videosList.map((videoMap) {
      return CatalogItem(
        videoName: videoMap['videoname'] as String,
        videoUrl: videoMap['videourl'] as String,
        date: videoMap['date'] as String,
        imageURL: videoMap['imageURL'] as String,
      );
    }).toList();
    return CatalogModel(lessonList: videos);
  }
}

class CatalogItem {
  final String videoName;
  final String videoUrl;
  final String imageURL;
  final String? date;

  CatalogItem({
    required this.videoName,
    required this.videoUrl,
    required this.imageURL,
    this.date,
  });
}
