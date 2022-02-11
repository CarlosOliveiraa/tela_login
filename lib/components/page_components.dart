import 'package:flutter/material.dart';

class PageComponents extends StatelessWidget {


  final double width;
  final double height;
  final String title;
  final String infoPage;

  const PageComponents({ Key? key, this.width = 210, this.height = 262, required this.title, required this.infoPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(children: [
        Text(title),
        TextFormField(),
      ]),
    );
  }
}