import 'package:elo_programming_task/scopedModel/main_model.dart';
import 'package:elo_programming_task/view/home_ui.dart';
import 'package:elo_programming_task/view/task_over_ui.dart';
import 'package:elo_programming_task/view/task_ui.dart';
import 'package:elo_programming_task/view/workouts.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: MainModel(),
        child: MaterialApp(
          title: 'Distance Tracker',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => HomeUI(),
            '/task': (context) => TaskUI(),
            '/finish': (context) => TaskOverUI(),
            '/workouts': (context) => WorkoutsUI(),
          },
        ));
  }
}
