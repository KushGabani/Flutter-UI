import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  static Future<User> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  static Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return "user-not-found";
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return "wrong-password";
      }
    } catch(e) {
      print(e.toString());
      return "error";
    }
  }

  static Future<String> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The provided password is too weak");
        return e.code;
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email");
        return e.code;
      }
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
}