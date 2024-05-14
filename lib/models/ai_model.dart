class AiModel {
  String text;
  String title;
  bool success;

  AiModel({required this.text, required this.title, required this.success});

  factory AiModel.fromJson(Map<dynamic, dynamic> json) {
    return AiModel(
      text: json['text'],
      title: json['title'],
      success: json['success']
    );
  }
}
