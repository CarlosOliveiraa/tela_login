import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        //statusBar
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        //navigationBar color
        systemNavigationBarColor: Colors.transparent, //bottom bar color
        systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
      ),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
