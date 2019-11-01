import 'package:elo_programming_task/scopedModel/main_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class WorkoutsUI extends StatefulWidget {
  bool isCalled = false;
  @override
  State<StatefulWidget> createState() {
    return new WorkoutsUIState();
  }
}

class WorkoutsUIState extends State<WorkoutsUI> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      if (!widget.isCalled) {
        model.generateWorkouts();
        widget.isCalled = true;
      }
      return !model.isWOLoaded
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Scaffold(
              appBar: AppBar(
                  title: Text('Workouts'),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context, false),
                  )),
              body: ListView.builder(
                  itemCount: model.workoutList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text("Checkpoints"),
                              content: new Container(
                                height: 100,
                                width: 100,
                                child: new ListView.builder(
                                    itemCount: model
                                        .workoutList[index].checkPoints.length,
                                    itemBuilder: (BuildContext ctxt, int i) {
                                      return new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text('Checkpoint '+model.workoutList[index]
                                              .checkPoints[i].checkpointId
                                              .toString()),
                                          Text(model.workoutList[index]
                                              .checkPoints[i].checkPointDistance
                                              .toString()+'m'),
                                        ],
                                      );
                                    }),
                              ),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog

                                new FlatButton(
                                  child: new Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: new Container(
                          color: Colors.grey.withOpacity(.50),
                          height: 50,
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(model.workoutList[index].date),
                              Text(
                                  model.workoutList[index].distance.toString()),
                              Text(model.workoutList[index].time)
                            ],
                          )),
                    );
                  }),
            );
    });
  }
}
