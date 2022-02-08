import 'package:flutter/material.dart';
import '../../domain/entities/dog_breed.dart';
import '../../domain/entities/sub_breed_params.dart';
import '../../presentation/screens/breeds/breed_screen.dart';
import '../../presentation/screens/home/home.dart';
import '../../presentation/screens/sub_breeds/sub_breed_images.dart';

class AppRoutesName {
  static const splash = '/';
  static const app = 'app';
  static const home = 'home';
  static const breeds = 'breeds';
  static const subBreeds = 'sub_breeds';
}

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.home:
        return _materialRoute(const HomeScreen());

      case AppRoutesName.breeds:
        return _materialRoute(BreedsScreen(dogBreedEnitiy: settings.arguments as DogBreedEnitiy));

      case AppRoutesName.subBreeds:
        return _materialRoute(SubBreedImageScreen(subBreedParams: settings.arguments as SubBreedParams));

      default:
        return _materialRoute(Container());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
