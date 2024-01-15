class CourseModel {
  final String name;
  final String instructor;
  final String duration;
  final DateTime releaseDate; // Güncel yayınlanma tarihi

  CourseModel({
    required this.name,
    required this.instructor,
    required this.duration,
    required this.releaseDate,
  });
}
