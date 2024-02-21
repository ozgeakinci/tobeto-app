class ExperienceInfo {
  String organizationName;
  String position;
  String startDate;
  String endDate;

  ExperienceInfo({
    required this.organizationName,
    required this.position,
    required this.startDate,
    required this.endDate,
  });

  factory ExperienceInfo.fromJson(Map<String, dynamic> json) {
    return ExperienceInfo(
      organizationName: json['organizationName'] as String,
      position: json['position'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'organizationName': organizationName,
      'position': position,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
