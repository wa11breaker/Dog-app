import 'package:flutter/material.dart';
import 'package:mbf/src/core/theme/theme_constants.dart';

import 'widgets/all_breeds.dart';
import 'widgets/random_dog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2.0;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.pets),
          title: const Text('Dog App'),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: height,
              width: double.infinity,
              child: const RandomDogWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: height - 40),
              decoration: kContainerDecoration,
              padding: const EdgeInsets.only(top: 30),
              child: const AllBreedsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
