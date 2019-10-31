import 'package:elo_programming_task/model/workout.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  bool _workoutFinished = false;
  bool _workoutSet = false;
  bool _isWOLoaded = false;
  double _workoutDistance = 0;

  void generateWorkouts() {
    List<Workout> workoutList = [];
    _isWOLoaded = true ;
    notifyListeners();
  }

  bool get workoutFinished => _workoutFinished;
  bool get workoutSet => _workoutSet;
  bool get isWOLoaded => _isWOLoaded;
  double get workoutDistance => _workoutDistance;

  void set workoutFinished(bool value) {
    _workoutFinished = value;
  }

  void set workoutSet(bool value) {
    _workoutSet = value;
  }

  void set isWOLoaded(bool value) {
    _isWOLoaded = value;
  }

  void set workoutDistance(double value) {
    _workoutDistance = value;
  }
}
