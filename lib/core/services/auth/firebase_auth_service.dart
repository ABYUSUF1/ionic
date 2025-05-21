import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  /// Returns the currently logged-in user, or null if no user is signed in.
  /// Signed in not mean the user has verified their email address.
  User? get currentUser => firebaseAuth.currentUser;

  /// Reloads the current user's data and checks if their email has been verified.
  Future<bool> isEmailVerified() async {
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      await user.reload(); // Use reload() to get the latest user data
      return user.emailVerified;
    }
    return false;
  }

  /// Creates a new user with the provided email and password
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    // Update the user's display name
    await userCredential.user?.updateDisplayName('$firstName $lastName');

    return userCredential;
  }

  /// Signs in an existing user with the provided email and password.
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Signs in a user using their Google account.
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await firebaseAuth.signInWithCredential(credential);
  }

  /// Sends a password reset email to the provided email address.
  Future<void> sendPasswordResetEmail(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  /// Sends an email verification link to the currently logged-in user's email address.
  Future<void> sendEmailVerification() async {
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }

  /// Signs out the currently logged-in user.
  Future<void> signOut() async {
    Future.wait([firebaseAuth.signOut(), googleSignIn.signOut()]);
  }

  //! We will not depend on firebase auth to update user's profile
  //! bec we still have many fields that firebase auth does not support
  //! like gender, birth date, etc..   so we will use firestore.
  /// Update user's name
  // Future<void> updateDisplayName(String fullName) async {
  //   await firebaseAuth.currentUser?.updateDisplayName(fullName);
  // }

  // /// Update user's profile url
  // Future<void> updateProfileUrl(String profileUrl) async {
  //   await firebaseAuth.currentUser?.updatePhotoURL(profileUrl);
  // }

  // /// Update phone number
  // Future<void> updatePhoneNumber(String phoneNumber) async {
  //   await firebaseAuth.currentUser?.updatePhoneNumber(
  //     PhoneAuthProvider.credential(verificationId: '', smsCode: ''),
  //   );
  // }
}
