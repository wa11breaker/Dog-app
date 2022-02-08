import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbf/src/core/theme/color.dart';
import 'package:mbf/src/presentation/widgets/app_littile.dart';
import 'package:mbf/src/presentation/widgets/shimmer_widget.dart';

import '../../../../core/di/get_it.dart';
import '../../../../core/route/route.dart';
import '../../../../domain/entities/dog_breed.dart';
import '../../../bloc/all_breeds/all_breeds_cubit.dart';

class AllBreedsWidget extends StatefulWidget {
  const AllBreedsWidget({Key? key}) : super(key: key);

  @override
  State<AllBreedsWidget> createState() => _AllBreedsWidgetState();
}

class _AllBreedsWidgetState extends State<AllBreedsWidget> {
  late AllBreedsCubit allBreed;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    allBreed = getItInstance<AllBreedsCubit>();
    allBreed.loadAllBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Expanded(
          child: BlocProvider(
            create: (_) => allBreed,
            child: BlocBuilder<AllBreedsCubit, AllBreedsState>(builder: (_, state) {
              if (state is AllBreedsLoaded) {
                final data = state.dogBreedEnitiy;
                return _buildBreedList(data);
              } else {
                return _buildLoadingList();
              }
            }),
          ),
        ),
      ],
    );
  }

  ListView _buildBreedList(List<DogBreedEnitiy> data) {
    void navigate(DogBreedEnitiy breedName) {
      Navigator.of(context).pushNamed(AppRoutesName.breeds, arguments: breedName);
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return AppLitTile(
          title: data[index].breedName,
          onTap: () => navigate(data[index]),
          enableTrailingIcon: data[index].subBreed.isNotEmpty,
        );
      },
    );
  }

  ListView _buildLoadingList() {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 30),
      itemCount: 20,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.centerLeft,
          child: ShimmerWidget(
            child: Container(
              width: 50.0 + random.nextInt(100),
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      },
    );
  }
}
