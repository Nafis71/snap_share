import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgLoader extends StatelessWidget {
  final String asset;
  final BoxFit boxFit;
  final double? height, width;
  final Color? color;

  const SvgLoader({
    super.key,
    required this.asset,
    this.boxFit = BoxFit.contain,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      fit: boxFit,
      color: color,
    );
  }
}
