import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitden_homeworkout/controllers/basic_controller.dart';
import 'package:fitden_homeworkout/controllers/exercise_controller.dart';
import 'package:fitden_homeworkout/models/classic_list.dart';
import 'package:fitden_homeworkout/models/user_detail_model.dart';
import 'package:fitden_homeworkout/views/pages/authentication/sign_in/sign_in_page.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/classic/classic_page.dart';
import 'package:fitden_homeworkout/views/pages/root/root_page.dart';
import 'package:fitden_homeworkout/views/pages/user_info/user_age_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  ExerciseController exerciseController = Get.put(ExerciseController());
  BasicController basicController = Get.put(BasicController());
  final firebaseUser = Rxn<User>();
  User get users => firebaseUser.value!;
  set users(User value) => firebaseUser.value = value;

  @override
  void onInit() {
    firebaseUser.bindStream(auth.authStateChanges());
    print('user state ${auth.authStateChanges().first} ');

    super.onInit();
  }

  //This method for auth pages like current user height,weight,name,email
  void signup({
    required String age,
    required String height,
    required String weight,
    required String exerciseType,
    required String username,
    required String email,
    required String password,
    required String image,
    required String exercisetypeid,
    String? numberofglass,
  }) async {
    Map<String, dynamic> userInfo = {
      'age': age,
      'height': height,
      'weight': weight,
      'exercisetype': exerciseType,
      'username': username,
      'email': email,
      'image': image,
      'exercisetypeid': exercisetypeid,
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
        firebaseFirestore
            .collection('user')
            .doc(auth.currentUser!.uid)
            .collection('water')
            .doc(auth.currentUser!.uid)
            .set({
          'numberofglass': numberofglass,
        });
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
    // print(auth.currentUser!.uid);
    try {
      DocumentSnapshot doc = await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .get();
      getuser = UserDetail.fromSnapshot(doc);

//getuser = doc;
      // ignore: avoid_print
      print(doc);
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
      String collectionname,
      String id,
      String exerciseTypeId,
      bool isStart) {
    firebaseFirestore.collection('user').doc(auth.currentUser!.uid).update({
      'age': age,
      'height': height,
      'weight': weight,
      'exercisetype': exerciseType,
      'exerciseTypeId': exerciseTypeId,
    }).then((value) {
      if (exerciseType == 'looksbetter' && isStart) {
        addData().then((value) {
          Get.to(() => const RootPage());
        });
      } else if (exerciseType == 'weightloose' && isStart) {
        addLooseData().then((value) {
          Get.to(() => const RootPage());
        });
      } else if (isStart) {
        addGainData().then((value) {
          Get.to(() => const RootPage());
        });
      }
      //  exerciseController.dayWiseStream();
    });
  }

//here we update the username
  void usernameUpdate(String username) {
    firebaseFirestore.collection('user').doc(auth.currentUser!.uid).update({
      'username': username,
    }).then((value) {
      getUserDetail();
      Get.back();
    });
  }

//here is the login method to get access of full app
  void login(String email, String password) async {
    // basicController.isLoad.value = true;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) {
      getUserDetail();
      // basicController.isLoad.value = false;

      Get.offAll(() => const RootPage());
    });
  }

  //here is the logout method

  void signOut() {
    auth.signOut().then((value) {
      Get.offAll(SignInPage());
    });
  }

  //here we get image from firebase
  void uploadImage(File? image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('profile')
        .child(auth.currentUser!.uid);
    await ref.putFile(image!);

    final url = await ref.getDownloadURL();
    await firebaseFirestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .update({
      'image': url,
    }).then((value) {
      Get.snackbar('Updated', 'Updated successfully...');
    });
  }

  void waterTracker({required String numberofglass}) async {
    Map<String, dynamic> water = {
      "numberofglass": numberofglass,
    };
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('water')
        .add(water)
        .then((value) {
      Get.snackbar('Added', 'Icrement done in water intake');
    });
  }

//here we sent data to firebase for looks better
  Future<void> addData() async {
    for (int i = 1; i <= 28; i++) {
      firebaseFirestore
          .collection('user')
          .doc(auth.currentUser?.uid)
          .collection('daywiseExercises')
          .add({
        'day': 'Day $i',
        'dayTime': DateTime.now(),
        'isStart': false,
        'description':
            "Just 5 - 10 min, this training is designed especially for beginners who want to looks good but don't know where to start.\n\nThis training mixes with basic aerobic and anaerobic exercises. It uses your bodyweight to work all muscles groups and boost your fat burning.\n\nLow impact option is friendlu for people who are overweight or have joint problems. Please stick to a low calorie diet to maximize your workout result.",
      }).then((value) {
        for (int j = 1; j <= classList.length; j++) {
          firebaseFirestore
              .collection('user')
              .doc(auth.currentUser?.uid)
              .collection('daywiseExercises')
              .doc(value.id)
              .collection('allexercises')
              .add({
            'image': classList[j].image,
            'title': classList[j].title,
            'description': classList[j].description,
            'noOfSets': i <= 7
                ? classList[j].noOfSets
                : i <= 14
                    ? 14
                    : i <= 21
                        ? 21
                        : 28,
          });
        }
        print('data added');
      });
    }
  }

//here we sent data to firebase for loose weight
  Future<void> addLooseData() async {
    for (int i = 1; i <= 28; i++) {
      firebaseFirestore
          .collection('user')
          .doc(auth.currentUser?.uid)
          .collection('daywiseExercises')
          .add({
        'day': 'Day $i',
        'isStart': false,
        'dayTime': DateTime.now(),
        'description':
            "Just 5 - 10 min, this training is designed especially for beginners who want to looks good but don't know where to start.\n\nThis training mixes with basic aerobic and anaerobic exercises. It uses your bodyweight to work all muscles groups and boost your fat burning.\n\nLow impact option is friendlu for people who are overweight or have joint problems. Please stick to a low calorie diet to maximize your workout result.",
      }).then((value) {
        for (int j = 1; j <= looseList.length; j++) {
          firebaseFirestore
              .collection('user')
              .doc(auth.currentUser?.uid)
              .collection('daywiseExercises')
              .doc(value.id)
              .collection('allexercises')
              .add({
            'image': looseList[j].image,
            'title': looseList[j].title,
            'description': looseList[j].description,
            'noOfSets': i <= 7
                ? looseList[j].noOfSets
                : i <= 14
                    ? 24
                    : i <= 21
                        ? 36
                        : 48,
          });
        }
        print('data added');
      });
    }
  }

//here we sent data to firebase for gain weight
  Future<void> addGainData() async {
    for (int i = 1; i <= 28; i++) {
      firebaseFirestore
          .collection('user')
          .doc(auth.currentUser?.uid)
          .collection('daywiseExercises')
          .add({
        'isStart': false,
        'day': 'Day $i',
        'dayTime': DateTime.now(),
        'description':
            "Just 5 - 10 min, this training is designed especially for beginners who want to looks good but don't know where to start.\n\nThis training mixes with basic aerobic and anaerobic exercises. It uses your bodyweight to work all muscles groups and boost your fat burning.\n\nLow impact option is friendlu for people who are overweight or have joint problems. Please stick to a low calorie diet to maximize your workout result.",
      }).then((value) {
        for (int j = 1; j <= gainList.length; j++) {
          firebaseFirestore
              .collection('user')
              .doc(auth.currentUser?.uid)
              .collection('daywiseExercises')
              .doc(value.id)
              .collection('allexercises')
              .add({
            'image': gainList[j].image,
            'title': gainList[j].title,
            'description': gainList[j].description,
            'noOfSets': i <= 7
                ? gainList[j].noOfSets
                : i <= 14
                    ? 18
                    : i <= 21
                        ? 24
                        : 30,
          });
        }
        print('data added');
      });
    }
  }

  Rx<List<DayWiseExerciseModel>> dayExercise =
      Rx<List<DayWiseExerciseModel>>([]);

  List<DayWiseExerciseModel> get getdayExercise => dayExercise.value;

  Rx<List<ClassicList>> allExercise = Rx<List<ClassicList>>([]);

  List<ClassicList> get getallExercise => allExercise.value;
  allExerciseStream(String id) {
    allExercise.bindStream(getAllExersicestream(id));
  }

  Stream<List<ClassicList>> getAllExersicestream(String id) {
    print('get Stream');
    return FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser?.uid)
        .collection('daywiseExercises')
        .doc(id)
        .collection('allexercises')
        //.orderBy('dayTime', descending: false)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ClassicList> retVal = [];
      for (var element in query.docs) {
        retVal.add(ClassicList.fromSnaphot(element));
      }
      print(retVal.length);
      print("all Stream wseStream:${retVal.length}");

      return retVal;
    });
  }

  void dayWiseStream() {
    dayExercise.bindStream(getdaywisestream());
  }

  Stream<List<DayWiseExerciseModel>> getdaywisestream() {
    print('get Stream');
    return FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser?.uid)
        .collection('daywiseExercises')
        .orderBy('dayTime', descending: false)
        .snapshots()
        .map((QuerySnapshot query) {
      List<DayWiseExerciseModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(DayWiseExerciseModel.fromSnapshot(element));
      }
      print(retVal.length);
      print("Day wseStream:${retVal.length}");

      return retVal;
    });
  }
}
