import 'model/user.dart';

import 'package:firebase_auth/firebase_auth.dart';

class UserPreferences {
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  static const myUser = LocalUser(
    imagePath:
    'assets/avatar.png',
    name: 'Piku',
    email: 'testmail@gmail.com',
    about:
    'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    isDarkMode: false,
  );
}