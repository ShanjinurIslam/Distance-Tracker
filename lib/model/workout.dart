import 'package:elo_programming_task/model/checkpoint.dart';

class Workout {
  String _date;
  double _distance;
  String _time;
  List<Checkpoint> _checkPoints;

  Workout(this._date, this._distance, this._checkPoints, this._time);

  String get date => _date;
  String get time => _time;
  double get distance => _distance;
  List<Checkpoint> get checkPoints => _checkPoints;
}
