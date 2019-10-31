import 'package:elo_programming_task/view/home_ui.dart';
import 'package:elo_programming_task/view/task_over_ui.dart';
import 'package:elo_programming_task/view/task_ui.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeUI(),
        '/task': (context) => TaskUI(),
        '/finish': (context) => TaskOverUI(),
      },
    );
  }
}
