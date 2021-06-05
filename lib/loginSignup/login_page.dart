  import 'package:flutter/material.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/colors/light_colors.dart';

  import 'package:flutter_app/home.dart';

  class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => new _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    late String _email, _password;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {

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
                child:Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Login",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                              ),

                          SizedBox(height: 10,),

                          Container(
                            width: double.infinity,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/loginPage.png')
                                )
                            ),
                          ),

                          //SizedBox(height: 30,)
                          Form(
                            key: _formKey,
                            child: Column(
                                children: <Widget>[
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
                          // ignore: deprecated_member_use

                          SizedBox(height: 10,),
                          ButtonTheme(
                            buttonColor: LightColors.kBlue,
                              minWidth: double.infinity,
                              child: RaisedButton(
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black
                                    ),
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Text('Sign In', style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18
                                ),),
                                onPressed: signIn,
                              )
                          ),],
                        ),
                      )
                          ],
                ),

        ),
      ),

      ],// This trailing comma makes auto-formatting nicer for build methods.
      ),
      ),
      );
    }


    Future<void> signIn() async{
      final formState = _formKey.currentState;
      Firebase.initializeApp();
      //validate fields
      if(formState!.validate()){
        //login to firebase
        formState.save();
        try{
          UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }catch(e){
          print(e);
        }

      }
      //login to firebase
    }
}