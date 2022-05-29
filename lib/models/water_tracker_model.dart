import 'package:cloud_firestore/cloud_firestore.dart';

class WaterTracker {
  String? id;
  int? numberofglass;
  WaterTracker({
    this.id,
    this.numberofglass,
  });
  WaterTracker.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    numberofglass = data['numberofglass'] ?? 0;
    print('data is:$id');
  }
}
