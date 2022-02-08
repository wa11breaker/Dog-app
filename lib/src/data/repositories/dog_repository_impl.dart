import 'package:dartz/dartz.dart';
import '../models/dog_breed_model.dart';
import '../../domain/entities/sub_breed_params.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/repositories/dog_repository.dart';
import '../data_source/dog_remote_data_source.dart';
import '../models/random_dog_model.dart';

class DogRepositoryImpl extends DogRepository {
  DogRepositoryImpl(this.remoteDataSource);

  final DogRemoteDataSource remoteDataSource;

  @override
  Future<Either<AppException, RandomDogModel>> getRandomDog() async {
    try {
      final randomDog = await remoteDataSource.getRandomDog();
      return Right(randomDog);
    } catch (e) {
      return const Left(FetchDataException());
    }
  }

  @override
  Future<Either<AppException, List<DogBreedModel>>> getDogBreedList() async {
    try {
      final dogBreeds = await remoteDataSource.getDogBreedList();

      return Right(dogBreeds);
    } catch (e) {
      return const Left(FetchDataException());
    }
  }

  @override
  Future<Either<AppException, List<String>>> getBreedImage(String breedName) async {
    try {
      final dogBreeds = await remoteDataSource.getBreedImage(breedName);

      return Right(dogBreeds);
    } catch (e) {
      return const Left(FetchDataException());
    }
  }

  @override
  Future<Either<AppException, List<String>>> getSubBreedImage(SubBreedParams subBreedParams) async {
    try {
      final dogBreeds = await remoteDataSource.getSubBreedImage(subBreedParams);

      return Right(dogBreeds);
    } catch (e) {
      return const Left(FetchDataException());
    }
  }
}
