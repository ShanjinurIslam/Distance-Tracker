import 'package:elo_programming_task/scopedModel/main_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scoped_model/scoped_model.dart';

class TaskOverUI extends StatefulWidget {
  bool notification_showed = false;
  TaskOverUI({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new TaskOverState();
  }
}

class TaskOverState extends State<TaskOverUI> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.pushReplacementNamed(context, '/workouts');
            },
          )
        ],
      ),
    );
  }

  Future _showNotificationWithDefaultSound(String value) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'shanjinur', 'ShanjinurIslam', 'dev',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    
    await flutterLocalNotificationsPlugin.show(
      0,
      'Task Complete',
      'You have completed $value m',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      if(!widget.notification_showed){
        print(model.workoutDistance);
        _showNotificationWithDefaultSound(model.workoutDistance.toString());
        widget.notification_showed = true ;
      }
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: (100.0 / 1080.0) * MediaQuery.of(context).size.height,
              left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: Text(
                'WOHOO!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: (250.0 / 1080.0) * MediaQuery.of(context).size.height,
              left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: Text(
                'You have met your goal',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
            ),
            Positioned(
              top: (450.0 / 1080.0) * MediaQuery.of(context).size.height,
              left: (100.0 / 600.0) * MediaQuery.of(context).size.width,
              right: (100.0 / 600.0) * MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/1.png',
                height: MediaQuery.of(context).size.height * .30,
                width: MediaQuery.of(context).size.width * .30,
              ),
            ),
            Positioned(
                bottom: (40.0 / 600.0) * MediaQuery.of(context).size.width,
                right: (40.0 / 600.0) * MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    child: Center(
                      child: Text(
                        'HOME',
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
