import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitden_homeworkout/controllers/user_controller.dart';
import 'package:fitden_homeworkout/models/classic_list.dart';
import 'package:get/get.dart';

class ExerciseController extends GetxController {
 // UserController userController = Get.put(UserController());
  Rx<List<ExerciseTypeModel>> exerciseType = Rx<List<ExerciseTypeModel>>([]);
  List<ExerciseTypeModel> get getexerciseType => exerciseType.value;

  
  Rx<List<ClassicList>> allexercise = Rx<List<ClassicList>>([]);
  List<ClassicList> get getallexercise => allexercise.value;

  String? id;
  String? collectionname;
  @override
  onInit() {
    super.onInit();
    exerciseType.bindStream(getexerciseStream());
  }

  Stream<List<ExerciseTypeModel>> getexerciseStream() {
    print('get Stream');
    return FirebaseFirestore.instance
        .collection('exercises')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ExerciseTypeModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(ExerciseTypeModel.fromSnapshot(element));
      }
      print(retVal.length);

      return retVal;
    });
  }

  

  // Stream<List<DayWiseExerciseModel>> getdaywisestream() {
  //   print('get Stream');
  //   return FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(userController.auth.currentUser?.uid)
  //       .collection('exercises')
  //       .doc(id)
  //       .collection(collectionname!)
  //       .orderBy('dayTime', descending: false)
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<DayWiseExerciseModel> retVal = [];
  //     for (var element in query.docs) {
  //       retVal.add(DayWiseExerciseModel.fromSnapshot(element));
  //     }
  //     print(retVal.length);
  //     print("Day wseStream:${retVal.length}");

  //     return retVal;
  //   });
  // }

  // void dayWiseStreamlogin(String collectionname, String id) {
  //   dayExercise.bindStream(getdaywisestreamlogin(
  //     collectionname,
  //     id,
  //   ));
  // }

  Stream<List<DayWiseExerciseModel>> getdaywisestreamlogin(
      String collectionname, String id) {
    print('get Stream');
    return FirebaseFirestore.instance
        .collection('exercises')
        .doc(id)
        .collection(collectionname)
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

  Stream<List<ClassicList>> getallexerciseStream() {
    print('get Stream');
    return FirebaseFirestore.instance
        .collection('exercises')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ClassicList> retVal = [];
      for (var element in query.docs) {
        retVal.add(ClassicList.fromSnaphot(element));
      }
      print(retVal.length);

      return retVal;
    });
  }
}
