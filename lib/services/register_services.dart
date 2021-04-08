import 'dart:io';
import 'package:app/models/register_model.dart';
import 'package:app/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignUpServices {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _authServices = new AuthServices();

  Future<UserModel> register(UserModel userModel, String image) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userModel.username, password: userModel.password);
    } catch (e) {
      print(e);
    }
    UserModel createdUser = await addNewUser(userModel, image);
    _authServices.updateStorage(createdUser);
    return createdUser;
  }

  Future<UserModel> addNewUser(UserModel userModel, String image) async {
    if (image != null && image.isNotEmpty) {
      userModel.image = await uploadImage(image, "123456789");
    }
    final ref = await _fireStore.collection("users").add(userModel.toJson());
    userModel.key = ref.id;
    return userModel;
  }

  Future<String> uploadImage(String imagePath, String code) async {
    final ref = FirebaseStorage.instance.ref().child("users_images/$code");
    final uploadTask = ref.putFile(File(imagePath));
    final imageUrl = (await (await uploadTask).ref.getDownloadURL()).toString();
    return imageUrl;
  }
}
