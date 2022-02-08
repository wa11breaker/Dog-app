import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppException, Type>> call(Params params);
}
