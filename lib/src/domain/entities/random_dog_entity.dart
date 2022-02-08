import 'package:equatable/equatable.dart';

class RandomDogEntity extends Equatable {
  const RandomDogEntity({required this.randomDogImage});

  final String randomDogImage;

  @override
  List<Object?> get props => [randomDogImage];

  @override
  bool get stringify => true;
}
