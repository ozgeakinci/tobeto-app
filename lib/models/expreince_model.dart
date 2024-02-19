class ExperienceInfo {
  String experienceName;
  String experienceDate;
  String experienceExplain;

  ExperienceInfo({
    required this.experienceName,
    required this.experienceDate,
    required this.experienceExplain,
  });

  factory ExperienceInfo.fromJson(Map<String, dynamic> json) {
    return ExperienceInfo(
      experienceName: json['experienceName'] as String,
      experienceDate: json['experienceDate'] as String,
      experienceExplain: json['experienceExplain'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'experienceName': experienceName,
      'experienceDate': experienceDate,
      'experienceExplain': experienceExplain,
    };
  }
}
