import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityIndicatorCircular extends StatelessWidget {
  final Color color;
  final double radius;

  const ActivityIndicatorCircular({
    super.key,
    this.color = Colors.black,
    this.radius = 10.1,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color,
        radius: radius,
      ),
    );
  }
}
