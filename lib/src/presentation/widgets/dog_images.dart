import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DogImagesGridView extends StatelessWidget {
  const DogImagesGridView({
    Key? key,
    required this.images,
    this.padding = const EdgeInsets.fromLTRB(8, 8, 8, 0),
  }) : super(key: key);

  final List<String> images;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: padding,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl: images[index],
          ),
        );
      },
    );
  }
}
