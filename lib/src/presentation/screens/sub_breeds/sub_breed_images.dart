import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbf/src/presentation/widgets/dog_images.dart';
import 'package:mbf/src/presentation/widgets/dog_image_loading.dart';

import '../../../core/di/get_it.dart';
import '../../../domain/entities/sub_breed_params.dart';
import '../../bloc/sub_breed_images/sub_breed_images_cubit.dart';

class SubBreedImageScreen extends StatefulWidget {
  final SubBreedParams subBreedParams;

  const SubBreedImageScreen({
    Key? key,
    required this.subBreedParams,
  }) : super(key: key);

  @override
  State<SubBreedImageScreen> createState() => _SubBreedImageScreenState();
}

class _SubBreedImageScreenState extends State<SubBreedImageScreen> {
  late SubBreedImageCubit subBreedsImageCubit;
  @override
  void initState() {
    super.initState();
    subBreedsImageCubit = getItInstance<SubBreedImageCubit>();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      subBreedsImageCubit.loadSubBreedImages(widget.subBreedParams);
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.subBreedParams.breedName[0].toUpperCase() + widget.subBreedParams.breedName.substring(1);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocProvider(
        create: (_) => subBreedsImageCubit,
        child: BlocBuilder<SubBreedImageCubit, SubBreedImagesState>(builder: (_, state) {
          if (state is SubBreedImagesLoaded) {
            final data = state.dogBreedEnitiy;
            return DogImagesGridView(images: data);
          } else if (state is SubBreedImagesError) {
            return Text(state.message.toString());
          } else {
            return const LoadingBreeds();
          }
        }),
      ),
    );
  }
}
