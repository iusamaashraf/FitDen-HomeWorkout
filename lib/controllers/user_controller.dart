import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitden_homeworkout/models/user_detail_model.dart';
import 'package:fitden_homeworkout/views/pages/root/root_page.dart';
import 'package:fitden_homeworkout/views/pages/user_info/user_age_page.dart';
import 'package:fitden_homeworkout/views/pages/user_info/user_height_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  //This method for auth pages like current user height,weight,name,email
  void signup({
    required String age,
    required String height,
    required String weight,
    required String exerciseType,
    required String username,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> userInfo = {
      'age': age,
      'height': height,
      'weight': weight,
      'exercisetype': exerciseType,
      'username': username,
      'email': email,
    };
    await auth
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) {
      firebaseFirestore
          .collection('user')
          .doc(value.user!.uid)
          .set(userInfo)
          .then((value) {
        Get.to(() => const UserAgePage());
      }).catchError((e) {
        Get.snackbar('Error', e.toString());
      });
    });
  }

//here we getting value
  Rx<UserDetail> userModel = UserDetail().obs;
  UserDetail get getuser => userModel.value;

  set getuser(UserDetail value) => userModel.value = value;
  getUserDetail() async {
    try {
      DocumentSnapshot doc = await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .get();
      print(doc);
      getuser = UserDetail.fromSnapshot(doc);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //now we create method for getting user info

  void updateUserDetail(
    String age,
    String height,
    String weight,
    String exerciseType,
  ) {
    firebaseFirestore.collection('user').doc(auth.currentUser!.uid).update({
      'age': age,
      'height': height,
      'weight': weight,
      'exercisetype': exerciseType,
    });
  }

//here is the login method to get access of full app
  void login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) {
      Get.offAll(() => const RootPage());
    });
  }
}
