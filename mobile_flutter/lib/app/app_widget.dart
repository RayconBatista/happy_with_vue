import 'package:flutter/material.dart';
import 'package:happy/splashscreen.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(60, 141, 188, 1.0),
        accentColor: Colors.green,
        fontFamily: 'Raleway',
      ),
      home: PrimeiraTela(),
      
    );
  }
}
