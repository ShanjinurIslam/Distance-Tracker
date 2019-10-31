import 'package:flutter/material.dart';

class TaskUI extends StatefulWidget {
  TaskUI({Key key, this.title}) : super(key: key);
  final String title;
  int counter = 0;
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<TaskUI> {
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
              child: ListView.builder(
                  itemCount: widget.counter,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Checkpoint ' + widget.counter.toString(),
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.50),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            Text(
                              widget.counter.toString() + 'm',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ));
                  }),
            ),
          ),
          Positioned(
              bottom: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              right: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.counter++;
                  });
                  if (widget.counter == 10) {
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
