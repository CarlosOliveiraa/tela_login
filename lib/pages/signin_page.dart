import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tela_login/components/custom_check.dart';
import 'package:tela_login/components/custom_textfield.dart';

import '../components/page_components.dart';
import '../constants/custom_text.dart';
import 'home_page.dart';
import 'signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  CustomText text = CustomText();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.4,
                color: Colors.blueAccent,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.09,
                      horizontal: size.width * 0.11,
                    ),
                    width: size.width,
                    height: size.height * 0.66,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size.width * 0.1),
                        topRight: Radius.circular(size.width * 0.1),
                      ),
                    ),
                    child: PageComponents(
                      width: size.width * 0.8,
                      height: size.height * 0.77,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text.signInTitle,
                              style: text.titleStyle,
                            ),
                            CustomTextField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Fill your e-mail adress";
                                  }
                                },
                                field: Field.email),
                            CustomTextField(
                                validator: (value) {
                                  if (value!.length < 6|| value.isEmpty) {
                                    return "Fill your password";
                                  }
                                },
                                field: Field.pass),
                            CustomCheck(
                              isChecked: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              textOne: text.remember,
                              width: 50,
                              textFive: text.passLink,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  text.signInInfo,
                                  style: text.infoStyle,
                                ),
                                FloatingActionButton(
                                  child: const Icon(Icons.arrow_forward),
                                  backgroundColor: Colors.indigo,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                    }
                                  },
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (contex) =>
                                            const SignUpPage()));
                              },
                              child: Text(
                                text.signUpLink,
                                style: text.linkStyle,
                              ),
                            ),
                          ]),
                    ),
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       "Welcome back",
                    //       style: TextStyle(
                    //           fontSize: size.width * 0.08,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.indigo),
                    //     ),
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         TextFormField(
                    //           validator: (value) {
                    //             if (value == null || value.isEmpty) {
                    //               return "Fill in your email";
                    //             }
                    //           },
                    //           keyboardType: TextInputType.emailAddress,
                    //           decoration: const InputDecoration(
                    //               labelText: "E-mail",
                    //               focusColor: Colors.indigo),
                    //         ),
                    //         TextFormField(
                    //           validator: (value) {
                    //             if (value == null || value.isEmpty) {
                    //               return "Fill in your password";
                    //             }
                    //           },
                    //           keyboardType: TextInputType.emailAddress,
                    //           decoration: const InputDecoration(
                    //               labelText: "Password",
                    //               fillColor: Colors.indigo),
                    //         ),
                    //         Row(
                    //           children: [
                    //             Checkbox(
                    //               value: isChecked,
                    //               onChanged: (bool? value) {
                    //                 setState(() {
                    //                   isChecked = value!;
                    //                 });
                    //               },
                    //               shape: CircleBorder(side: BorderSide.none),
                    //               activeColor: Colors.indigo,
                    //             ),
                    //             Text("Remember me"),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           "Sign In",
                    //           style: TextStyle(
                    //               color: Colors.indigo,
                    //               fontSize: size.width * 0.05,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         FloatingActionButton(
                    //           onPressed: () {
                    //             if (_formKey.currentState!.validate()) {
                    //               Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) => HomePage()));
                    //             }
                    //           },
                    //           child: const Icon(Icons.arrow_forward),
                    //           backgroundColor: Colors.indigo,
                    //         ),
                    //       ],
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => const SignUpPage()));
                    //       },
                    //       child: Text(
                    //         "Sign Up",
                    //         style: TextStyle(
                    //             color: Colors.indigo,
                    //             fontSize: size.width * 0.04,
                    //             fontWeight: FontWeight.bold,
                    //             decoration: TextDecoration.underline),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
