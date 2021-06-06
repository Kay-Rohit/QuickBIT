import 'package:flutter/material.dart';
import 'package:flutter_app/colors/light_colors.dart';

import 'package:flutter_app/loginSignup/login_page.dart';
import 'package:flutter_app/loginSignup/sign_up.dart';

class Welcome extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: LightColors.kBlue,
          title: Center(
            child: Text('QuickBIT', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900
            ),),
          )
        ),
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Welcome",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        "Your all in one college solution",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/welcomePage.png')
                        )
                    ),
                  ),

                  SizedBox(height: 30,),

                  Column(
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          color: Colors.white70,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                    fullscreenDialog: true));
                          },
                          child: Text('Login', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      ButtonTheme(
                        minWidth: double.infinity,
                        child:  RaisedButton(
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          color: LightColors.kBlue,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                    fullscreenDialog: true));
                          },
                          child: Text('Sign Up', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ));
  }
}

