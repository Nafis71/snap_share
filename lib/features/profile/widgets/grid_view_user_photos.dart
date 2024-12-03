import 'package:flutter/material.dart';
import 'package:snap_share/core/wrappers/custom_cached_image.dart';

class GridViewUserPhotos extends StatelessWidget {
  const GridViewUserPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> userPhotos = List.generate(
      20,
      (index) => {'imageUrl': 'https://picsum.photos/200?random=$index'},
    );
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // তিনটি পোস্ট এক লাইনে
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: userPhotos.length,
      itemBuilder: (context, index) {
        final post = userPhotos[index];
        return CustomCachedImage(
          imageUrl: post['imageUrl']!,
          width: 100,
          height: 100,
          borderRadius: BorderRadius.circular(8),
        );
      },
    );
  }
}
