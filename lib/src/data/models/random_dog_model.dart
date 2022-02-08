import '../../domain/entities/random_dog_entity.dart';

class DogBreedRawModel {
  DogBreedRawModel({
    required this.message,
    required this.status,
  });

  final Map<String, List<String>> message;
  final String status;

  factory DogBreedRawModel.fromJson(Map<String, dynamic> json) => DogBreedRawModel(
        message: Map.from(json["message"])
            .map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": Map.from(message).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
      };
}

class RandomDogModel extends RandomDogEntity {
  final String message;
  final String status;

  const RandomDogModel({
    required this.message,
    required this.status,
  }) : super(randomDogImage: message);

  factory RandomDogModel.fromJson(Map<String, dynamic> json) => RandomDogModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
