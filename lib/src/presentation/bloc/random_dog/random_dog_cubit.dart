import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/random_dog_entity.dart';
import '../../../domain/usecases/get_random_dog.dart';
import '../../../domain/usecases/no_params.dart';

part 'random_dog_state.dart';

class RandomDogCubit extends Cubit<RandomDogState> {
  final GetRandomDog getRandomDog;

  RandomDogCubit({
    required this.getRandomDog,
  }) : super(RandomDogInitial());

  loadRandomDog() async {
    emit(RandomDogLoading());

    final randomDogEither = await getRandomDog(NoParams());
    emit(randomDogEither.fold(
      (l) => RandomDogError(l),
      (r) => RandomDogLoaded(r),
    ));
  }
}
