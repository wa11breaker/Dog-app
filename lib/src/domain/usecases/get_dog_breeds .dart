import 'package:dartz/dartz.dart';
import '../entities/dog_breed.dart';

import '../entities/app_error.dart';
import '../repositories/dog_repository.dart';
import 'no_params.dart';
import 'usercase.dart';

class GetDogBreedList extends UseCase<List<DogBreedEnitiy>, NoParams> {
  final DogRepository repository;

  GetDogBreedList(this.repository);

  @override
  Future<Either<AppException, List<DogBreedEnitiy>>> call(params) async {
    return await repository.getDogBreedList();
  }
}
