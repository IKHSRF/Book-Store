import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<String> registerUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<String> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }
}
