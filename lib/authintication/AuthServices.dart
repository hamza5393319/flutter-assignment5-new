import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUp(String userEmail, String userPassword) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Unknown error occurred during sign-up.";
    } catch (e) {
      throw "Error occurred: $e";
    }
  }

  Future<void> signIn(String userEmail, String userPassword) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Unknown error occurred during sign-in.";
    } catch (e) {
      throw "Error occurred: $e";
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }
}
