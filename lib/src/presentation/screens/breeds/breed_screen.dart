import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/get_it.dart';
import '../../../core/route/route.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/theme_constants.dart';
import '../../../domain/entities/dog_breed.dart';
import '../../../domain/entities/sub_breed_params.dart';
import '../../bloc/breed_images/breed_images_cubit.dart';
import '../../widgets/app_littile.dart';
import '../../widgets/dog_images.dart';
import '../../widgets/dog_image_loading.dart';

class BreedsScreen extends StatefulWidget {
  final DogBreedEnitiy dogBreedEnitiy;
  const BreedsScreen({Key? key, required this.dogBreedEnitiy}) : super(key: key);

  @override
  State<BreedsScreen> createState() => _BreedsScreenState();
}

class _BreedsScreenState extends State<BreedsScreen> {
  late BreedImageCubit subBreedsCubit;
  @override
  void initState() {
    super.initState();
    subBreedsCubit = getItInstance<BreedImageCubit>();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      subBreedsCubit.loadBreedImages(widget.dogBreedEnitiy.breedName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final maxExtend = MediaQuery.of(context).size.height / 3;
    final title = widget.dogBreedEnitiy.breedName[0].toUpperCase() + widget.dogBreedEnitiy.breedName.substring(1);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          BlocProvider(
            create: (_) => subBreedsCubit,
            child: BlocBuilder<BreedImageCubit, BreedImagesState>(
              builder: (_, state) {
                if (state is BreedImagesLoaded) {
                  final data = state.dogBreedEnitiy;
                  return DogImagesGridView(
                    images: data,
                    padding: EdgeInsets.fromLTRB(8, 8, 0, maxExtend),
                  );
                } else if (state is BreedImagesError) {
                  return Text(state.message.toString());
                } else {
                  return const LoadingBreeds();
                }
              },
            ),
          ),
          _buildSubBreedList(),
        ],
      ),
    );
  }

  Widget _buildSubBreedList() {
    final maxExtend = MediaQuery.of(context).size.height / 3;

    return widget.dogBreedEnitiy.subBreed.isNotEmpty
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: BoxConstraints(maxHeight: maxExtend),
              padding: const EdgeInsets.only(top: 30),
              decoration: kContainerDecoration,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Tap on breed to view more picture',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 100,
                    margin: const EdgeInsets.fromLTRB(30, 8, 0, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.secondary,
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: widget.dogBreedEnitiy.subBreed.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AppLitTile(
                          title: widget.dogBreedEnitiy.subBreed[index],
                          onTap: () => navigate(widget.dogBreedEnitiy.subBreed[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  navigate(String subBreedName) {
    Navigator.of(context).pushNamed(
      AppRoutesName.subBreeds,
      arguments: SubBreedParams(breedName: widget.dogBreedEnitiy.breedName, subBreedName: subBreedName),
    );
  }
}
