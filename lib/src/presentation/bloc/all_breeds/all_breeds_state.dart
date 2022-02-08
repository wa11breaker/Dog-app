part of 'all_breeds_cubit.dart';

abstract class AllBreedsState extends Equatable {
  const AllBreedsState();

  @override
  List<Object> get props => [];
}

class AllBreedsInitial extends AllBreedsState {}

class AllBreedsLoading extends AllBreedsState {}

class AllBreedsLoaded extends AllBreedsState {
  final List<DogBreedEnitiy> dogBreedEnitiy;
  const AllBreedsLoaded(this.dogBreedEnitiy);
}

class AllBreedsError extends AllBreedsState {
  final AppException message;
  const AllBreedsError(this.message);
}
