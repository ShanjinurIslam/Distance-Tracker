import 'package:flutter/material.dart';

class TaskOverUI extends StatelessWidget {
  TaskOverUI({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
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
  }
}
