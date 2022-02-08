import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbf/src/presentation/widgets/shimmer_widget.dart';

import '../../../../core/di/get_it.dart';
import '../../../bloc/random_dog/random_dog_cubit.dart';

const kBorderRadious = 2.0;

class RandomDogWidget extends StatefulWidget {
  const RandomDogWidget({Key? key}) : super(key: key);

  @override
  State<RandomDogWidget> createState() => _RandomDogWidgetState();
}

class _RandomDogWidgetState extends State<RandomDogWidget> {
  late RandomDogCubit randomDogCubit;

  @override
  void initState() {
    super.initState();
    randomDogCubit = getItInstance<RandomDogCubit>();
    randomDogCubit.loadRandomDog();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => randomDogCubit,
      child: BlocBuilder<RandomDogCubit, RandomDogState>(
        builder: (_, state) {
          return _randomDogImage(state);
        },
      ),
    );
  }

  Widget _randomDogImage(RandomDogState state) {
    if (state is RandomDogLoaded) {
      return Image.network(
        state.randomDog.randomDogImage,
        fit: BoxFit.cover,
      );
    } else if (state is RandomDogError) {
      return Center(child: Text(state.message.toString()));
    } else {
      return ShimmerWidget(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kBorderRadious),
          ),
        ),
      );
    }
  }
}
