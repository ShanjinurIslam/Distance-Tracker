import 'package:flutter/material.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: (100.0 / 1080.0) * MediaQuery.of(context).size.height,
              left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: Text(
                'SET\nYOUR\nWALKING\nGOAL',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: (200.0 / 1080.0) * MediaQuery.of(context).size.height,
              left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextField(
                  autofocus: true,
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Set Target Distance (Meters)',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: (200.0 / 1080.0) * MediaQuery.of(context).size.height,
              left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextField(
                  autofocus: true,
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Set Target Distance (Meters)',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            Positioned(
                bottom: (40.0 / 600.0) * MediaQuery.of(context).size.width,
                right: (40.0 / 600.0) * MediaQuery.of(context).size.width,
                child: InkWell(
                  child: Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    child: Center(
                      child: Text('START',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                    ),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
