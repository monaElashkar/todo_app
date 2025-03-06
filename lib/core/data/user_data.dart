import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static bool authStateChanges() {
    bool result = false;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        result = false;
      } else {
        result = true;
      }
    });
    return result;
  }
}
