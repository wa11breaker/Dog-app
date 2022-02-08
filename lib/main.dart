import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbf/src/core/theme/color.dart';

import 'src/core/di/get_it.dart' as get_it;
import 'src/core/route/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(get_it.init());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            elevation: 0,
          ),
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: AppRoutesName.home,
        scrollBehavior: const ScrollBehaviorModified(),
      ),
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
