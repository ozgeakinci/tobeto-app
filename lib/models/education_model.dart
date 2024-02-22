class EducationInfo {
  String schoolName;
  String department;
  String startDate;
  String endDate;

  EducationInfo({
    required this.schoolName,
    required this.department,
    required this.startDate,
    required this.endDate,
  });

  factory EducationInfo.fromJson(Map<String, dynamic> json) {
    return EducationInfo(
      schoolName: json['schoolName'] as String,
      department: json['department'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolName': schoolName,
      'department': department,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
