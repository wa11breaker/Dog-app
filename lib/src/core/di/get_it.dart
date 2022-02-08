import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mbf/src/domain/usecases/get_sub_breed_image.dart';
import '../../data/repositories/dog_repository_impl.dart';
import '../../domain/repositories/dog_repository.dart';
import '../../domain/usecases/get_dog_breeds%20.dart';
import '../../domain/usecases/get_breed_image.dart';
import '../../presentation/bloc/all_breeds/all_breeds_cubit.dart';
import '../../presentation/bloc/breed_images/breed_images_cubit.dart';
import '../../presentation/bloc/random_dog/random_dog_cubit.dart';
import '../../presentation/bloc/sub_breed_images/sub_breed_images_cubit.dart';

import '../../data/data_source/dog_remote_data_source.dart';
import '../../domain/usecases/get_random_dog.dart';
import '../api_client/api_client.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<DogRemoteDataSource>(() => DogRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<DogRepository>(() => DogRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<GetRandomDog>(() => GetRandomDog(getItInstance()));
  getItInstance.registerLazySingleton<GetDogBreedList>(() => GetDogBreedList(getItInstance()));
  getItInstance.registerLazySingleton<BreedImage>(() => BreedImage(getItInstance()));
  getItInstance.registerLazySingleton<SubBreedImage>(() => SubBreedImage(getItInstance()));

  // cubit
  getItInstance.registerFactory<RandomDogCubit>(() => RandomDogCubit(getRandomDog: getItInstance()));
  getItInstance.registerFactory<AllBreedsCubit>(() => AllBreedsCubit(getBreedList: getItInstance()));
  getItInstance.registerFactory<BreedImageCubit>(() => BreedImageCubit(getSubDogBreedList: getItInstance()));
  getItInstance.registerFactory<SubBreedImageCubit>(() => SubBreedImageCubit(getSubDogBreedList: getItInstance()));
}
