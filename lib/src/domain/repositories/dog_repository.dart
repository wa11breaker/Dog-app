import 'package:dartz/dartz.dart';
import '../../data/models/dog_breed_model.dart';
import '../entities/sub_breed_params.dart';

import '../../data/models/random_dog_model.dart';
import '../entities/app_error.dart';

abstract class DogRepository {
  Future<Either<AppException, RandomDogModel>> getRandomDog();
  Future<Either<AppException, List<DogBreedModel>>> getDogBreedList();
  Future<Either<AppException, List<String>>> getBreedImage(String breedName);
  Future<Either<AppException, List<String>>> getSubBreedImage(SubBreedParams subBreedParams);
}
