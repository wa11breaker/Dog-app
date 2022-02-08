import 'package:equatable/equatable.dart';

class SubBreedParams extends Equatable {
  final String breedName;
  final String subBreedName;

  const SubBreedParams({
    required this.breedName,
    required this.subBreedName,
  });

  @override
  List<Object?> get props => [breedName, subBreedName];
}
