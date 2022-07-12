import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // need to call the below fucntion from login screen

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    //checking if user is logged in or not

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // asking user details

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    // storing data in firebase

    User? user = userCredential.user;
    // We just want to save the data once the user signs in

    if (user != null) {
      // means user is logged in
      if (userCredential.additionalUserInfo!.isNewUser) {
        _firestore.collection('users').doc(user.uid).set({
          'username': user.displayName,
          'uid': user.uid,
          'profilePhoto': user.photoURL,
        });
      }
    }
  }
}
