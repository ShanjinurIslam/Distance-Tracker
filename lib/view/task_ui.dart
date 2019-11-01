import 'dart:async';
import 'package:elo_programming_task/controller/workout_controller.dart';
import 'package:elo_programming_task/model/checkpoint.dart';
import 'package:elo_programming_task/model/checkpoint.dart' as prefix0;
import 'package:elo_programming_task/model/workout.dart';
import 'package:elo_programming_task/scopedModel/main_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedometer/pedometer.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';

class TaskUI extends StatefulWidget {
  TaskUI({Key key, this.title}) : super(key: key);
  final String title;
  int counter = 0;
  List<Checkpoint> checkPoints = [];
  @override
  _TaskState createState() => _TaskState();
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class _TaskState extends State<TaskUI> {
  Pedometer _pedometer;
  StreamSubscription<int> _subscription;
  int _stepCountValue;
  bool stepCountingStart = false;
  int initial = 0;
  int checkpointValue = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    startListening();
  }

  void onData(int stepCountValue) {
    print(stepCountValue);
  }

  void startListening() {
    _pedometer = new Pedometer();
    _subscription = _pedometer.pedometerStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void stopListening() {
    _subscription.cancel();
  }

  void _onData(int stepCountValue) async {
    setState(() {
      _stepCountValue = stepCountValue;
      if (!stepCountingStart) {
        initial = _stepCountValue;
        stepCountingStart = true;
      }
      _stepCountValue = _stepCountValue - initial;
    });
  }

  void _onDone() => print("Finished pedometer tracking");

  void _onError(error) => print("Flutter Pedometer Error: $error");

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: (100.0 / 1080.0) * MediaQuery.of(context).size.height,
              left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: new Text(
                'TRACKING NOW...\nDistance Covered: ' +
                    (_stepCountValue).toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: (400.0 / 1080.0) * MediaQuery.of(context).size.height,
              left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              right: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * .75,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: widget.checkPoints.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return new Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Checkpoint ' +
                                      widget.checkPoints[index].checkpointId
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(.50),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  widget.checkPoints[index].checkPointDistance
                                          .round()
                                          .toString() +
                                      'm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ));
                      }),
                ),
              ),
            ),
            Positioned(
                bottom: (40.0 / 600.0) * MediaQuery.of(context).size.width,
                right: (40.0 / 600.0) * MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    _scrollController.animateTo(
                      MediaQuery.of(context).size.height * .60,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 500),
                    );
                    setState(() {
                      widget.counter++;
                      //checkpointValue = (_stepCountValue - checkpointValue)  ;
                      Checkpoint checkpoint = new Checkpoint(widget.counter, 0);
                      widget.checkPoints.add(checkpoint);
                    });
                    if (/*_stepCountValue >= model.workoutDistance~/0.76 || */ widget
                            .counter ==
                        5) {
                      DateTime now = DateTime.now();
                      String date = DateFormat('EEE d MMM yyyy').format(now);
                      String time = DateFormat('kk:mm:ss').format(now);
                      Workout workout = new Workout(date, model.workoutDistance,
                          widget.checkPoints, time);
                      model.uploadData(workout);
                      Navigator.pushReplacementNamed(
                        context,
                        '/finish',
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    child: Center(
                      child: Text(
                        'ADD CHECKPOINT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      );
    });
  }
}
