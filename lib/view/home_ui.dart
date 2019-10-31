import 'package:elo_programming_task/scopedModel/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeUI extends StatefulWidget {
  double distance = -1;
  @override
  State<StatefulWidget> createState() {
    return new HomeUIState();
  }
}

class HomeUIState extends State<HomeUI> {
  final _text = TextEditingController();
  bool _validate = false;

  Widget homeUIScreen() {
    return ScopedModelDescendant<MainModel>(
        builder: (context, child, model) => Scaffold(
                body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top:
                          (100.0 / 1080.0) * MediaQuery.of(context).size.height,
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
                      bottom:
                          (200.0 / 1080.0) * MediaQuery.of(context).size.height,
                      left: (40.0 / 600.0) * MediaQuery.of(context).size.width,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: TextField(
                          controller: _text,
                          onSubmitted: (String v) {
                            widget.distance = double.parse(v);
                          },
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          decoration: InputDecoration(
                              errorText:
                                  _validate ? 'Value Can\'t Be Empty' : null,
                              hintText: 'Set Target Distance (Meters)',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom:
                            (40.0 / 600.0) * MediaQuery.of(context).size.width,
                        right:
                            (40.0 / 600.0) * MediaQuery.of(context).size.width,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _text.text.isEmpty
                                  ? _validate = true
                                  : _validate = false;
                            });
                            if(_text.text.isEmpty==false){
                              model.workoutDistance = double.parse(_text.text);
                            Navigator.pushReplacementNamed(context, '/task');
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(30.0)),
                            ),
                            child: Center(
                              child: Text(
                                'START',
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
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: homeUIScreen(),
    );
  }
}
