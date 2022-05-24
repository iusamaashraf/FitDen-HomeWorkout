import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetail {
  String? id;
  String? age;
  String? height;
  String? weight;
  String? exerciseType;
  UserDetail({
    this.id,
    this.age,
    this.height,
    this.weight,
    this.exerciseType,
  });
  UserDetail.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    age = data['age'] ?? "";
    height = data['height'] ?? "";
    weight = data['weight'] ?? "";
    exerciseType = data['exercisetype'] ?? "";
  }
}
