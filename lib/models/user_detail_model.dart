import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetail {
  String? id;
  String? age;
  String? height;
  String? weight;
  String? username;
  String? exerciseType;
  String? email;
  UserDetail({
    this.id,
    this.age,
    this.height,
    this.weight,
    this.username,
    this.exerciseType,
    this.email,
  });
  UserDetail.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    age = data['age'] ?? "";
    height = data['height'] ?? "";
    weight = data['weight'] ?? "";
    username = data['username'] ?? "";
    exerciseType = data['exercisetype'] ?? "";
    email = data['email'] ?? "";
    print('data is :$id');
  }
}
