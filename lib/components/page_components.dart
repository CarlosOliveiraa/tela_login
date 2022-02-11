import 'package:flutter/material.dart';

class PageComponents extends StatelessWidget {
  final double width;
  final double height;

  final Widget child;

  const PageComponents(
      {Key? key, this.width = 250, this.height = 263, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      height: height,
      child: child,
    );
  }
}
