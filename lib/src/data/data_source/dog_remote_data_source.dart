import '../models/dog_breed_model.dart';
import '../models/breed_image_model.dart';
import '../../domain/entities/sub_breed_params.dart';

import '../../core/api_client/api_client.dart';
import '../models/random_dog_model.dart';

abstract class DogRemoteDataSource {
  Future<RandomDogModel> getRandomDog();
  Future<List<DogBreedModel>> getDogBreedList();
  Future<List<String>> getBreedImage(String breedName);
  Future<List<String>> getSubBreedImage(SubBreedParams breedName);
}

class DogRemoteDataSourceImpl extends DogRemoteDataSource {
  DogRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<RandomDogModel> getRandomDog() async {
    final res = await _client.get('breeds/image/random');
    final randomDog = RandomDogModel.fromJson(res);
    return randomDog;
  }

  @override
  Future<List<DogBreedModel>> getDogBreedList() async {
    final res = await _client.get('breeds/list/all');
    final rawData = DogBreedRawModel.fromJson(res);

    List<DogBreedModel> dogBreeds = [];
    rawData.message.forEach((key, value) {
      dogBreeds.add(DogBreedModel(name: key, subBreedList: value));
    });
    return dogBreeds;
  }

  @override
  Future<List<String>> getBreedImage(String breedName) async {
    final res = await _client.get('breed/$breedName/images');
    final subBreed = BreedImageModel.fromJson(res);
    return subBreed.message;
  }

  @override
  Future<List<String>> getSubBreedImage(SubBreedParams breedName) async {
    final res = await _client.get('breed/${breedName.breedName}/${breedName.subBreedName}/images');
    final subBreed = BreedImageModel.fromJson(res);
    return subBreed.message;
  }
}
