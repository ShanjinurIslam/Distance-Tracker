import 'package:elo_programming_task/api/workout_rest.dart';
import 'package:elo_programming_task/model/workout.dart';

class WorkoutController {
  WorkoutRest rest = WorkoutRest();
  List<Workout> fetchWorkOut() {
    List<Workout> workouts = rest.getData();
    return workouts;
  }

  void uploadData(Workout workout) {
    Map<String, dynamic> dataObject = new Map();
    dataObject["time"] = workout.time;
    dataObject["distance"] = workout.distance;
    dataObject["date"] = workout.date;
    dataObject["checkpoints"] = workout.checkPoints.map((attribute) {
      Map<String, dynamic> checkPointsMap = new Map<String, dynamic>();
      checkPointsMap["id"] = attribute.checkpointId;
      checkPointsMap["distance"] = attribute.checkPointDistance;
      return checkPointsMap;
    }).toList();
    rest.createRecord(dataObject);
  }
}
