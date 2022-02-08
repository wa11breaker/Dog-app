import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/get_breed_image.dart';

import '../../../domain/entities/app_error.dart';

part 'breed_images_state.dart';

class BreedImageCubit extends Cubit<BreedImagesState> {
  final BreedImage getSubDogBreedList;

  BreedImageCubit({
    required this.getSubDogBreedList,
  }) : super(BreedImagesInitial());

  Future<void> loadBreedImages(String breedName) async {
    emit(BreedImagesLoading());
    final subBreedEither = await getSubDogBreedList(breedName);
    emit(subBreedEither.fold(
      (l) => BreedImagesError(l),
      (r) => BreedImagesLoaded(r),
    ));
  }
}
