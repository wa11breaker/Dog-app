// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbf/src/domain/entities/random_dog_entity.dart';
import 'package:mbf/src/domain/usecases/get_random_dog.dart';
import 'package:mbf/src/domain/usecases/no_params.dart';
import 'package:mbf/src/presentation/bloc/random_dog/random_dog_cubit.dart';
import 'package:mockito/mockito.dart';

class MocGetRandomDog extends Mock implements GetRandomDog {}

void main() {
  group('Random api', () {
    late GetRandomDog getRandomDog;
    late RandomDogCubit randomDogCubit;

    setUp(() {
      getRandomDog = MocGetRandomDog();
      randomDogCubit = RandomDogCubit(getRandomDog: getRandomDog);
    });
    blocTest(
      'Random dog of the day',
      build: () {
        when(getRandomDog.call(NoParams()).then((value) => Future.value(RandomDogEntity(randomDogImage: 'fo'))));
        return randomDogCubit;
      },
      act: (RandomDogCubit bloc) {
        bloc.getRandomDog;
      },
      expect: () => [
        RandomDogInitial(),
        RandomDogLoading(),
      ],
    );
  });
}
