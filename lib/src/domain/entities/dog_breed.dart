import 'package:equatable/equatable.dart';

class DogBreedEnitiy extends Equatable {
  final String breedName;
  final List<String> subBreed;

  const DogBreedEnitiy({required this.breedName, required this.subBreed});

  @override
  List<Object?> get props => [breedName, subBreed];
}
