class BreedImageModel {
  final List<String> message;
  final String status;

  BreedImageModel({
    required this.message,
    required this.status,
  });

  factory BreedImageModel.fromJson(Map<String, dynamic> json) {
    return BreedImageModel(
      message: json['message']?.cast<String>() ?? [],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
