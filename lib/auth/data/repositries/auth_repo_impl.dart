import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spot_it/auth/domain/repostries/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  // Create User With Eamil And Password
  Future<UserCredential> signUp({String? email, String? password}) async {
    try {
      // Creat User With Email And Password
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email!.trim(), password: password!);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> signinWithEmailAndPass(
      {String? email, String? password}) async {
    try {
      // Sign In With Email And Password
      final UserCredential userCredintial =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return userCredintial.user;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  @override
  Future<UserCredential> signinWithGoogle() async {
    try {
      // Trigger the Authentication Flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain The Auth Details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credintial
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      // Once Signed in , return user credential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw 'im in auth repo ${e.code}';
    }
  }
}
