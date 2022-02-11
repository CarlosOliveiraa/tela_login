import 'package:flutter/material.dart';

class CustomText {
  final String signInTitle = "Welcome back";
  final String signInInfo = "Sign In";
  final String signUpLink = "Sign Up";
  final String remember = "Remember me";
  final String passLink = "Forgot password?";

  final String signUpTitle = "Get Started";
  final String signUpInfo = "Sign Up";
  final String signInLink = "Sign In";

  final TextStyle titleStyle = const TextStyle(
      color: Colors.indigo, fontSize: 35, fontWeight: FontWeight.bold);
  final TextStyle infoStyle = const TextStyle(
      color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold);
  final TextStyle linkStyle = const TextStyle(
      color: Colors.indigo,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline);
  final TextStyle linkStyle2 = const TextStyle(
      color: Colors.indigo, decoration: TextDecoration.underline);
}
