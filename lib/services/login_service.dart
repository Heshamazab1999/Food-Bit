import 'package:app/models/register_model.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/utility/utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginServices {
  final _authServices = new AuthServices();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<UserModel> login(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await getUserByEmail(context, email);
    _authServices.updateStorage(createdUser);
    return createdUser;
  }

  Future<UserModel> getUserByEmail(BuildContext context, String email) async {
    final data = await _fireStore
        .collection("users")
        .where("username", isEqualTo: email)
        .get();
    if (data.docs.length > 0) {
      return UserModel.fromSnapshot(data.docs.first);
    }
    throw Utility.displayErrorAlert(
        "Wrong to find your Email !", "Wrong", context);
  }

  googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    print(googleSignInAccount);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _auth.signInWithCredential(credential);
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
