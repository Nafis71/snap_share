import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoader extends StatelessWidget {
  final String asset;
  final double? width, height;
  final Animation<double>? controller;
  final bool? repeat;
  final BoxFit fit;

  const AnimationLoader({
    //wrapper class for third-party packages
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.controller,
    this.repeat,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      asset,
      width: width,
      height: height,
      controller: controller,
      renderCache: RenderCache.drawingCommands,
      repeat: repeat,
      fit: fit,
    );
  }
}
