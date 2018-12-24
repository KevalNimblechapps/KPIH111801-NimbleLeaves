import 'package:flutter/material.dart';
import 'package:nimble_leaves/custom_icons_icons.dart';
import 'package:nimble_leaves/menu/menu.dart';

class SecondScreen extends StatelessWidget {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return new Scaffold(
        endDrawer: new DrawerOnly(),
        key: _scaffoldKey,
        appBar: new AppBar(
            automaticallyImplyLeading: false,
            leading: new Container(
              child: Image.asset('images/logo.png'),
              padding: EdgeInsets.only(left: 15),
            ),
            title: MediaQuery.of(context).size.width <= 767
                ? null
                : new DrawerOnly(),
            backgroundColor: Color.fromRGBO(248, 250, 251, 1.0),
            elevation: 0.0,
            actions: MediaQuery.of(context).size.width <= 767
                ? <Widget>[
                    Column(
                      children: <Widget>[
                        new Text(
                          '06',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(78, 125, 254, 1),
                              fontSize: 22,
                              height: 1,
                              fontFamily: 'SairaSemiCondensed'),
                        ),
                        new Text(
                          'DEC',
                          style: TextStyle(
                              color: Color.fromRGBO(78, 125, 254, 1),
                              fontSize: 16,
                              height: 0.4,
                              fontFamily: 'SairaSemiCondensed'),
                        ),
                      ],
                    ),
                    IconButton(
                        icon: Icon(CustomIcons.menunew),
                        color: Colors.blueGrey,
                        onPressed: () =>
                            _scaffoldKey.currentState.openEndDrawer())
                  ]
                : <Widget>[
                    Column(
                      children: <Widget>[
                        new Text(
                          '06',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(78, 125, 254, 1),
                              fontSize: 27,
                              height: 1,
                              fontFamily: 'SairaSemiCondensed'),
                        ),
                        new Text(
                          'DEC',
                          style: TextStyle(
                              color: Color.fromRGBO(78, 125, 254, 1),
                              fontSize: 18,
                              height: 0.4,
                              fontFamily: 'SairaSemiCondensed'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 28),
                    )
                  ]));
  }
}
