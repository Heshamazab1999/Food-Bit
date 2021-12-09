import 'package:app/models/register_model.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/utility/utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginServices {
  final _authServices = new AuthServices();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future reset(UserModel userModel) async {
    try {
      await _auth.sendPasswordResetEmail(email: userModel.username);
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel> login(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await getUserByEmail(context, password, email);
    _authServices.updateStorage(createdUser);
    return createdUser;
  }

  Future<UserModel> getUserByEmail(
      BuildContext context, String password, String email) async {
    final data = await _fireStore
        .collection("users")
        .where("password", isEqualTo: password)
        .where("username", isEqualTo: email)
        .get();
    if (data.docs.length > 0) {
      return UserModel.fromSnapshot(data.docs.first);
    }
    throw Utility.displayErrorAlert(
        "Wrong to find your Email !", "Wrong", context);
  }
}
