part of 'random_dog_cubit.dart';

abstract class RandomDogState extends Equatable {
  const RandomDogState();

  @override
  List<Object> get props => [];
}

class RandomDogInitial extends RandomDogState {}

class RandomDogLoading extends RandomDogState {}

class RandomDogLoaded extends RandomDogState {
  final RandomDogEntity randomDog;
  const RandomDogLoaded(this.randomDog);
}

class RandomDogError extends RandomDogState {
  final AppException message;
  const RandomDogError(this.message);
}
