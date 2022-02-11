import 'package:flutter/material.dart';

import '../constants/custom_decorations.dart';

enum Field { name, email, pass }

class CustomTextField extends StatelessWidget {
  final String? Function(String? value)? validator;
  final Field field;

  const CustomTextField({Key? key, this.validator, required this.field})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late InputDecoration decoration;
    CustomDecorations myDecoration = CustomDecorations();

    switch (field) {
      case Field.name:
        decoration = myDecoration.name;
        break;
      case Field.email:
        decoration = myDecoration.email;
        break;
      case Field.pass:
        decoration = myDecoration.password;
        break;
      default:
    }

    return TextFormField(
      validator: validator,
      decoration: decoration,
    );
  }
}
