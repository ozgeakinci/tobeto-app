class LanguageModel {
  String language;
  String level;

  LanguageModel({
    required this.language,
    required this.level,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      language: json['language'] as String,
      level: json['level'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': language,
      'level': level,
    };
  }
}
