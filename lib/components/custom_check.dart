import 'package:flutter/material.dart';

import '../constants/custom_text.dart';

class CustomCheck extends StatelessWidget {
  final bool isChecked;
  final Function(bool?)? onChanged;
  final String? textOne;
  final String? textTwo;
  final String? textTree;
  final String? textFour;
  final String textFive;
  final double? width;

  const CustomCheck(
      {Key? key,
      required this.onChanged,
      required this.isChecked,
      this.textOne,
      this.textTwo,
      this.textTree,
      this.textFour,
      this.textFive = "",
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomText myText = CustomText();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: Colors.indigo,
          shape: const CircleBorder(),
          side: const BorderSide(width: 2, color: Colors.indigo),
        ),
        RichText(
          text: TextSpan(
            text: textOne,
            style: const  TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: textTwo,
                style: myText.linkStyle2,
              ),
              TextSpan(text: textTree),
              TextSpan(
                text: textFour,
                style: const TextStyle(color: Colors.indigo),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width,
        ),
        Text(
          textFive,
          style: myText.linkStyle2,
        )
        // Text(checkText),
        //  const SizedBox(
        //   width: 65,
        // ),
        // Text(
        //   linkText,
        //   style: text.linkStyle2,
        // ),
      ],
    );
  }
}
