import 'package:elo_programming_task/model/workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutRest {
  final databaseReference = Firestore.instance;

  void createRecord(Map<String, dynamic> dataobject) async {
    DocumentReference ref =
        await databaseReference.collection("workouts").add(dataobject);
    print(ref.documentID);
  }

  List<Workout> getData() {
    List<Workout> workouts = [];
    databaseReference
        .collection("workouts")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {});
    });

    return workouts;
  }

  void deleteData(String documentName) {
    try {
      databaseReference.collection('workouts').document(documentName).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
