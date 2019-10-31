import 'package:elo_programming_task/scopedModel/main_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class WorkoutsUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WorkoutsUIState();
  }
}

class WorkoutsUIState extends State<WorkoutsUI> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      return model.isWOLoaded
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : ListView.builder(
              itemCount: model.workoutList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(model.workoutList[index].date),
                        Text(model.workoutList[index].distance.toString()),
                        Text(model.workoutList[index].time)
                      ],
                    ));
              });
    });
  }
}
