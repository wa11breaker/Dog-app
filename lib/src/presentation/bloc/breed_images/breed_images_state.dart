part of 'breed_images_cubit.dart';

abstract class BreedImagesState extends Equatable {
  const BreedImagesState();

  @override
  List<Object> get props => [];
}

class BreedImagesInitial extends BreedImagesState {}

class BreedImagesLoading extends BreedImagesState {}

class BreedImagesLoaded extends BreedImagesState {
  final List<String> dogBreedEnitiy;
  const BreedImagesLoaded(this.dogBreedEnitiy);
}

class BreedImagesError extends BreedImagesState {
  final AppException message;
  const BreedImagesError(this.message);
}
