import 'package:flutter/material.dart';
import 'package:nimble_leaves/menu/menu.dart';

class SecondScreen extends StatelessWidget {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return new Scaffold(
        endDrawer: new DrawerOnly(),
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text(""),
          leading: Image.asset('images/logo.png'),
          backgroundColor: Color.fromRGBO(248, 250, 251, 1),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                color: Colors.blueGrey,
                onPressed: () => _scaffoldKey.currentState.openEndDrawer()),
            IconButton(
                icon: Icon(Icons.menu),
                color: Colors.blueGrey,
                onPressed: () => _scaffoldKey.currentState.openEndDrawer())
          ],
        ));
  }
}
