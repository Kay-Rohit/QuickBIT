import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/colors/light_colors.dart';

import 'package:flutter_app/loginSignup/login_page.dart';
import 'package:flutter_app/loginSignup/welcome.dart';

class Profile extends StatelessWidget{

  final User? userInfo = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //profile
    var profile = Expanded(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
          SizedBox(height: 10,),
          Text("${userInfo!.email}", style: TextStyle(
              fontSize: 22
          ),),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: LightColors.kBlue,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Text('Update Profile', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ],
      ),

    );

    //header
    var header = Expanded(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          profile,
          SizedBox(height: 5,)
        ],
      ),
    );

    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      appBar: AppBar(
        backgroundColor: LightColors.kBlue,
          title: Center(
            child: Text('Profile'),
          )
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.data!.docs[0]["role"] == "admin"){

          }
          return Column(
            children: <Widget>[
              SizedBox(height: 30,),
              header,
              Spacer(),
              Align(
                  alignment: Alignment.bottomRight,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: LightColors.kRed,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text('Logout', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),),
                    onPressed: () {
                      signOut();
                      Navigator.of(context).pop();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                    },
                  )
              ),
            ],
          );









          /* Center(
                child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    children: <Widget>[
                      Text("${userInfo!.email}", style: TextStyle(
                          fontSize: 32
                      ),),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.black
                                ),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text('Logout', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),),
                            onPressed: () {
                              signOut();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                          )
                      ),
                    ],
                  )
                ),

              ); */

        },
      ),
    );
  }

  Future<void> signOut() async{
    Firebase.initializeApp();
      try{
        await FirebaseAuth.instance.signOut();
      }catch(e){
        print(e);
      }

    }
  }

/*class ProfileListItems extends StatelessWidget{
  Key key;
  final IconData icon;
  final text;
  final bool hasNavigation;

  ProfileListItems({
    required this.icon,
    this.text,
    this.hasNavigation = false,
  }) : super(key: key)

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6).copyWith(bottom: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
          children: <Widget>[
            Icon(this.icon, size: 20),
            SizedBox(width: 5,),
            Text(this.text),
            Icon(Icons.arrow_right)
          ]
      ),
    );
  }
}
*/