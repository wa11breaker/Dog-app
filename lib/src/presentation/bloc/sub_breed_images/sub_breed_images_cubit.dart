import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/sub_breed_params.dart';
import '../../../domain/usecases/get_breed_image.dart';
import '../../../domain/usecases/get_sub_breed_image.dart';

import '../../../domain/entities/app_error.dart';

part 'sub_breed_images_state.dart';

class SubBreedImageCubit extends Cubit<SubBreedImagesState> {
  final SubBreedImage getSubDogBreedList;

  SubBreedImageCubit({
    required this.getSubDogBreedList,
  }) : super(SubBreedImagesInitial());

  Future<void> loadSubBreedImages(SubBreedParams breedName) async {
    emit(SubBreedImagesLoading());
    final subBreedEither = await getSubDogBreedList(breedName);
    emit(subBreedEither.fold(
      (l) => SubBreedImagesError(l),
      (r) => SubBreedImagesLoaded(r),
    ));
  }
}
