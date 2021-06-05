import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/pages/profilePage.dart';
import 'package:flutter_app/pages/homePage.dart';

import 'package:flutter_app/colors/light_colors.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex = 0;
  static List<Widget> _children = <Widget>[
    HomePage(),
    Profile(),
  ];
  final User? userInfo = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:
      _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: LightColors.kBlue,
        backgroundColor: LightColors.kLightYellow,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
            ),
            ],
            ),
          );
    }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}
