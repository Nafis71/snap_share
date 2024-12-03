import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/wrappers/custom_cached_image.dart';

class ListViewUserPhotos extends StatelessWidget {
  const ListViewUserPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> userPhotos = List.generate(
      20,
      (index) => {'imageUrl': 'https://picsum.photos/200?random=$index'},
    );
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: userPhotos.length,
      itemBuilder: (context, index) {
        final post = userPhotos[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              CustomCachedImage(
                imageUrl: post['imageUrl']!,
                width: 100,
                height: 100,
                borderRadius: BorderRadius.circular(8),
              ),
              const Gap(8),
              Expanded(
                child: Text(
                  "Image : $index",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
