import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CalendarModel {
  final List<CalendarLessonModel> lessons;

  CalendarModel({required this.lessons});

  factory CalendarModel.fromCalendarFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? videosList = snapshot.data()?['lessons'];
    if (videosList == null) {
      return CalendarModel(lessons: []);
    }
    List<CalendarLessonModel> videos = videosList.map((lessonMap) {
      DateTime dateTime = (lessonMap['date'] as Timestamp).toDate();

      return CalendarLessonModel(
        dershoca: lessonMap['instructor'] as String,
        derskonu: lessonMap['subject'] as String,
        derstarih: dateTime,
      );
    }).toList();
    return CalendarModel(lessons: videos);
  }
}

class CalendarLessonModel {
  final String dershoca;
  final String derskonu;
  final DateTime derstarih;

  CalendarLessonModel({
    required this.dershoca,
    required this.derskonu,
    required this.derstarih,
  });
}
