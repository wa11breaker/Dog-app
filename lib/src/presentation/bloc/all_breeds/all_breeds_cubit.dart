import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/no_params.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/dog_breed.dart';
import '../../../domain/usecases/get_dog_breeds .dart';

part 'all_breeds_state.dart';

class AllBreedsCubit extends Cubit<AllBreedsState> {
  final GetDogBreedList getBreedList;

  AllBreedsCubit({
    required this.getBreedList,
  }) : super(AllBreedsInitial());

  Future<void> loadAllBreeds() async {
    emit(AllBreedsLoading());
    final allBreedEither = await getBreedList(NoParams());
    emit(allBreedEither.fold(
      (l) => AllBreedsError(l),
      (r) => AllBreedsLoaded(r),
    ));
  }
}
