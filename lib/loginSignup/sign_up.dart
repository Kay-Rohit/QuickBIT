import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validators/validators.dart';

import 'package:flutter_app/colors/light_colors.dart';
import 'package:flutter_app/loginSignup/login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  late String _email, _password, _cnfrmpass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
/*
//To show errors returned by firestore
  Widget showAlert() {
    if(_error != null){
      return Container(
        color: LightColors.kRed,
        width: double.infinity,
        padding: EdgeInsets.only(right: 8.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.error_outline),
            Expanded(child: Text(_error, maxLines: 3,)),
            IconButton(onPressed: (){
              setState(() {

              });
            }, icon: Icon(Icons.close))
          ],
        ),
      );
    }
    return SizedBox(height: 0,);
  }
  */

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
                      //showAlert(),
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
                                        if(input!.isEmpty || !isEmail(input)){
                                          return 'Please enter a valid email';
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
                                      onSaved: (input) => _cnfrmpass = input!,
                                    ),
                                    // ignore: deprecated_member_use
                                    SizedBox(height: 40,),
                                    ButtonTheme(
                                      minWidth: double.infinity,
                                      buttonColor: LightColors.kBlue,
                                      child: RaisedButton(
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
                                    SizedBox(height: 10,),
                                    Text("Already have an account?"),
                                    FlatButton(
                                      child: Text("Login here!"),
                                      onPressed: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                      },
                                    )
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
        //UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password'){
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          /*setState(() {
            _error = e.message!;
          });
          */
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }

    }
    //login to firebase
  }
}