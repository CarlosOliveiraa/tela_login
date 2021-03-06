import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/custom_check.dart';
import '../components/custom_textfield.dart';
import '../components/page_components.dart';
import '../constants/custom_text.dart';
import 'home_page.dart';
import 'signin_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    CustomText text = CustomText();

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
                        horizontal: size.width * 0.11),
                    width: size.width,
                    height: size.height * 0.8,
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
                              text.signUpTitle,
                              style: text.titleStyle,
                            ),
                            CustomTextField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Fill you name";
                                  }
                                },
                                field: Field.name),
                            CustomTextField(
                                validator: (value) {
                                  if (!value!.contains('@') || value.isEmpty) {
                                    return "Fill you e-mail adress";
                                  }
                                },
                                field: Field.email),
                            CustomTextField(
                                validator: (value) {
                                  if (value!.length < 6 || value.isEmpty) {
                                    return "Fill you password";
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
                              textOne: "I agree to the ",
                              textTwo: "Terms of service ",
                              textTree: "and ",
                              textFour: "Privacy Policy",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  text.signUpInfo,
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
                                              builder: ((context) =>
                                                  const HomePage())));
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
                                        builder: ((context) =>
                                            const SignInPage())));
                              },
                              child: Text(
                                text.signInLink,
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
                    //       "Get Started",
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
                    //               return "Fill in your name";
                    //             }
                    //           },
                    //           keyboardType: TextInputType.name,
                    //           decoration: const InputDecoration(
                    //               labelText: "Name", focusColor: Colors.indigo),
                    //         ),
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
                    //           "Sign Up",
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
                    //                       builder: (context) =>
                    //                           const HomePage()));
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
                    //                 builder: (context) => SignInPage()));
                    //       },
                    //       child: Text(
                    //         "Sign In",
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
