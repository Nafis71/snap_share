import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Function(ImageProvider)? imageProviderWidget;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.imageProviderWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) =>
            placeholder ??
            const Center(
              child: AnimationLoader(asset: LottieAssets.kAnimatedLoader),
            ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              color: Colors.grey[300],
              child: const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
        imageBuilder: (context, imageProvider) {
          if (imageProviderWidget != null) {
            return imageProviderWidget!(imageProvider);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
