import 'package:flutter/material.dart';
import 'package:flutter_app/loginSignup/welcome.dart';

import 'colors/light_colors.dart';

void main(){
  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QucikBIT App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: LightColors.kDarkBlue,
          displayColor: LightColors.kDarkBlue,
          fontFamily: 'Poppins'
        ),
      ),
      home: Welcome(),
    );
  }
}


