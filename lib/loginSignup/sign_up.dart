import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/colors/light_colors.dart';

import 'package:flutter_app/loginSignup/login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  late String _email, _password, _confrmpass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: true,
        backgroundColor: LightColors.kLightYellow,
        appBar: AppBar(
          backgroundColor: LightColors.kBlue,
          //title: Text("Login"),
        ),
      body: Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
               child: Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "SignUP",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      validator: (input){
                                        if(input!.isEmpty){
                                          return 'Please type an email';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Email'
                                      ),
                                      onSaved: (input) => _email = input!,
                                    ),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      validator: (input){
                                        if(input!.length < 6){
                                          return 'Your Password must be 6 characters long';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Password'
                                      ),
                                      onSaved: (input) => _password = input!,
                                      obscureText: true,
                                    ),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'confirm password'
                                      ),
                                      onSaved: (input) => _confrmpass = input!,
                                    ),
                                    // ignore: deprecated_member_use
                                    SizedBox(height: 30,),
                                    ButtonTheme(
                                      minWidth: double.infinity,
                                      child: RaisedButton(
                                        hoverColor: Colors.lightBlue,
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.black
                                            ),
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        onPressed: signUp,
                                        child: Text('Sign Up', style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18
                                        ),),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] // This trailing comma makes auto-formatting nicer for build methods.
                ),
        )
    );
  }


  Future<void> signUp() async{
    final formState = _formKey.currentState;
    Firebase.initializeApp();
    //validate fields
    if(formState!.validate()){
      //signup to firebase
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password
        );
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }

    }
    //login to firebase
  }
}