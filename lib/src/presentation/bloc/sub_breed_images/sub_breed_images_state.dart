part of 'sub_breed_images_cubit.dart';

abstract class SubBreedImagesState extends Equatable {
  const SubBreedImagesState();

  @override
  List<Object> get props => [];
}

class SubBreedImagesInitial extends SubBreedImagesState {}

class SubBreedImagesLoading extends SubBreedImagesState {}

class SubBreedImagesLoaded extends SubBreedImagesState {
  final List<String> dogBreedEnitiy;
  const SubBreedImagesLoaded(this.dogBreedEnitiy);
}

class SubBreedImagesError extends SubBreedImagesState {
  final AppException message;
  const SubBreedImagesError(this.message);
}
