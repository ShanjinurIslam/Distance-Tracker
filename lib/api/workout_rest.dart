import 'dart:math';

import 'package:elo_programming_task/model/checkpoint.dart';
import 'package:elo_programming_task/model/workout.dart';
import 'package:firebase_database/firebase_database.dart';

class WorkoutRest {
  List<Workout> workouts = [];
  final databaseReference = FirebaseDatabase.instance.reference();
  int count = 0;
  void createRecord(Map<String, dynamic> dataobject) async {
    databaseReference
        .child(Random().nextInt(100000000).toString())
        .set(dataobject);
    count++;
  }

  Future<List<Workout>> getData() async {
    Map<dynamic, dynamic> map;
    await databaseReference.once().then((DataSnapshot snapshot) {
      map = snapshot.value;
      List<dynamic> keys = map.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Map<dynamic, dynamic> dataObject = map[keys[i].toString()];
        String date = dataObject["date"].toString();
        int distance = dataObject["distance"];
        String time = dataObject["time"].toString();
        List<dynamic> checkPoints = dataObject["checkpoints"];
        List<Checkpoint> listCheckpoints = [] ;
        for(int i=0;i<checkPoints.length;i++){
          Map<dynamic,dynamic> object = checkPoints[i];
          int d = object["distance"];
          Checkpoint c= new Checkpoint(object["id"],d.toDouble());
          listCheckpoints.add(c);
        }
        
        Workout workout =
            new Workout(date, distance.toDouble(), listCheckpoints,time);
        workouts.add(workout);
      }
    });
    return workouts;
  }

  void deleteData(String documentName) {}
}
