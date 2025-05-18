import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Current user
  User? get user => firebaseAuth.currentUser;

  // isEmailVerified
  bool get isEmailVerified => user?.emailVerified ?? false;

  // Sign in
  Future<void> signIn({required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign up
  Future<void> signUp({required String email, required String password}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Google sign in
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      await firebaseAuth.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        ),
      );
    }
  }

  // Forget password
  Future<void> forgetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // send

  // Sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
