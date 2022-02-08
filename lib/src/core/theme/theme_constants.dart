import 'package:flutter/material.dart';
import 'package:mbf/src/core/theme/color.dart';

final kContainerDecoration = BoxDecoration(
  color: AppColors.white,
  boxShadow: [
    BoxShadow(
      blurRadius: 12,
      color: Colors.black.withOpacity(0.2),
    ),
  ],
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  ),
);
