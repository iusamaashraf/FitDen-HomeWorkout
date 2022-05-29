import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitden_homeworkout/models/water_tracker_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  RxBool isLoad = false.obs;

  void waterTracker({required int numberofglass}) async {
    print("The user is:${auth.currentUser!.uid}");
    Map<String, dynamic> water = {
      "numberofglass": numberofglass,
    };
    await firebaseFirestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('water')
        .doc(auth.currentUser!.uid)
        .set(water)
        .then((value) {
      Get.snackbar('Updated', 'Data is updated');
    });
  }

  Rx<WaterTracker> waterModel = WaterTracker().obs;
  WaterTracker get getwater => waterModel.value;
  set getwater(WaterTracker value) => waterModel.value = value;
  getWaterDetail() async {
    // print(auth.currentUser!.uid);
    try {
      DocumentSnapshot doc = (await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('water')
          .doc(auth.currentUser!.uid)
          .get());

      // ignore: avoid_print
      print(doc);
      getwater = WaterTracker.fromSnapshot(doc);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateWaterTracker(int waterintake) {
    print(waterintake);
    firebaseFirestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('water')
        .doc(auth.currentUser!.uid)
        .update({
      "numberofglass": waterintake,
    }).then((value) {
      getWaterDetail();
    });
  }
}
