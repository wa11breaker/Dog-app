import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../repositories/dog_repository.dart';
import 'usercase.dart';

class BreedImage extends UseCase<List<String>, String> {
  final DogRepository repository;

  BreedImage(this.repository);

  @override
  Future<Either<AppException, List<String>>> call(params) async {
    return await repository.getBreedImage(params);
  }
}
