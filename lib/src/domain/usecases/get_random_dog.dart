import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/random_dog_entity.dart';
import '../repositories/dog_repository.dart';
import 'no_params.dart';
import 'usercase.dart';

class GetRandomDog extends UseCase<RandomDogEntity, NoParams> {
  final DogRepository repository;

  GetRandomDog(this.repository);

  @override
  Future<Either<AppException, RandomDogEntity>> call(params) async {
    return await repository.getRandomDog();
  }
}
