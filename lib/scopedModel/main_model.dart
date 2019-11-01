import 'package:elo_programming_task/controller/workout_controller.dart';
import 'package:elo_programming_task/controller/workout_controller.dart'
    as prefix0;
import 'package:elo_programming_task/model/workout.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  bool _workoutFinished = false;
  bool _isWOLoaded = false;
  double _workoutDistance = 0;
  prefix0.WorkoutController workoutController = new WorkoutController();
  List<Workout> _workoutList = [];

  void generateWorkouts() async {
    _workoutList.clear();
    _workoutList = await workoutController.fetchWorkOut();
    _isWOLoaded = true;
    notifyListeners();
  }

  List<Workout> get workoutList => _workoutList;

  bool get workoutFinished => _workoutFinished;
  bool get isWOLoaded => _isWOLoaded;
  double get workoutDistance => _workoutDistance;

  void set workoutFinished(bool value) {
    _workoutFinished = value;
  }

  void set isWOLoaded(bool value) {
    _isWOLoaded = value;
  }

  void set workoutDistance(double value) {
    _workoutDistance = value;
  }

  void uploadData(Workout workout) {
    workoutController.uploadData(workout);
  }
}
