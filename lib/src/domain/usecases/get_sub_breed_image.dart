import 'package:dartz/dartz.dart';
import '../entities/sub_breed_params.dart';

import '../entities/app_error.dart';
import '../repositories/dog_repository.dart';
import 'usercase.dart';

class SubBreedImage extends UseCase<List<String>, SubBreedParams> {
  final DogRepository repository;

  SubBreedImage(this.repository);

  @override
  Future<Either<AppException, List<String>>> call(params) async {
    return await repository.getSubBreedImage(params);
  }
}
