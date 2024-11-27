import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenteredCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final double radius;

  const CenteredCircularProgressIndicator({
    super.key,
    this.color = Colors.black,
    this.radius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CupertinoActivityIndicator(
        color: color,
        radius: radius,
      )
    );
  }
}
