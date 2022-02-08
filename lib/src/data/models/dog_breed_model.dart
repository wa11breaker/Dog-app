import '../../domain/entities/dog_breed.dart';

class DogBreedModel extends DogBreedEnitiy {
  final String name;
  final List<String> subBreedList;

  const DogBreedModel({
    required this.name,
    required this.subBreedList,
  }) : super(
          breedName: name,
          subBreed: subBreedList,
        );

  factory DogBreedModel.fromJson(Map<String, dynamic> map) {
    return DogBreedModel(
      name: map['name'] ?? '',
      subBreedList: map['subBreed'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subBreed': subBreed,
    };
  }
}
