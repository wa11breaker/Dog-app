import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mbf/src/presentation/widgets/shimmer_widget.dart';

class LoadingBreeds extends StatelessWidget {
  const LoadingBreeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemBuilder: (context, index) {
        return ShimmerWidget(
          child: Container(
            height: (index % 5 + 1) * 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      },
    );
  }
}
