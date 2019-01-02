import 'package:flutter/material.dart';

class Position extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("FrameLayout"),
          leading: null,
        ),
        body: new Container(
          constraints: BoxConstraints.expand(),
          color: Colors.tealAccent,
          child: new Stack(
            children: [
              Positioned(
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.red,
                ),
                top: 10.0,
                left: 10.0,
              ),
              Positioned(
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  color: Colors.blue,
                ),
                top: 30.0,
                right: 50.0,
              ),
              Positioned(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.green,
                ),
                bottom: 100.0,
                left: 30.0,
              ),
              Positioned(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.yellow,
                ),
                bottom: 50.0,
                right: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
