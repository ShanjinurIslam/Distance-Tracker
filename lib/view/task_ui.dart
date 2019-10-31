import 'package:elo_programming_task/model/checkpoint.dart';
import 'package:flutter/material.dart';

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
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: (100.0 / 1080.0) * MediaQuery.of(context).size.height,
            left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
            child: Text(
              'TRACKING\nNOW...',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 70,
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
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ));
                    }),
              ),
            ),
          ),
          Positioned(
              bottom: (40.0 / 600.0) * MediaQuery.of(context).size.width ,
              right: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  _scrollController.animateTo(
                    MediaQuery.of(context).size.height*.60,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );
                  setState(() {
                    widget.counter++;
                    Checkpoint checkpoint = new Checkpoint(
                        widget.counter, widget.counter.toDouble());
                    widget.checkPoints.add(checkpoint);
                  });
                  if (widget.counter == 15) {
                    Navigator.pushReplacementNamed(context, '/finish');
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
  }
}
