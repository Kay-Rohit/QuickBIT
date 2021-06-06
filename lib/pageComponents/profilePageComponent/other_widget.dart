import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(context, Icons.upload_file, 'Upload to Vault', (){throw UnimplementedError();}),
      buildDivider(),
      buildButton(context, Icons.shield_outlined, 'Privacy', (){throw UnimplementedError();}),
      buildDivider(),
      buildButton(context, Icons.exit_to_app, 'Logout', (){return signOut;}),
    ],
  );
  Widget buildDivider() => Container(
    height: 24,
    child: VerticalDivider(),
  );

  // ignore: non_constant_identifier_names
  Widget buildButton(BuildContext context, IconData icon, String text, Function onclick()) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: onclick,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
                icon
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  Future<void> signOut() async{
    Firebase.initializeApp();
    try{
      await FirebaseAuth.instance.signOut();
    }catch(e){
      print(e);
    }

  }
}