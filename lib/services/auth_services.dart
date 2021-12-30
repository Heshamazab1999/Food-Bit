import 'package:app/models/register_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app/Controller/auth_controller.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  final _storage = FlutterSecureStorage();

  updateStorage(UserModel userModel) async {
    await _storage.write(key: 'users', value: userModel.key);
  }

  Future<UserModel> getCurrentUser() async {
    final userKey = await _storage.read(key: 'users');
    if (userKey == null) {
      return null;
    }
    return UserModel.fromSnapshot(
        await _store.collection('users').doc(userKey).get());
  }

  signOut() async {
    await _auth.signOut();
    _storage.delete(key: 'users');
    AuthController.to.changeLoggedIn(false, null);
  }
}
