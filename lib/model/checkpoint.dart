import 'package:elo_programming_task/model/workout.dart';

class Checkpoint{
  int _checkpointId ;
  double _checkpointDistance;
  Checkpoint(this._checkpointId,this._checkpointDistance);
  
  int get checkpointId => _checkpointId;
  double get checkPointDistance => _checkpointDistance ;
}