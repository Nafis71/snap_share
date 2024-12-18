import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final ImageProvider imageProvider;
  final double height;
  final double width;
  final Widget? child;
  final double radius;
  final BoxFit boxFit;

  const ImageWidget({
    super.key,
    required this.imageProvider,
    this.height = 85,
    this.width = 85,
    this.child,
    this.radius = 4,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(image: imageProvider, fit: boxFit),
      ),
      child: child,
    );
  }
}
