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
          title: new Text(""),
          leading: Image.asset('images/logo.png'),
          backgroundColor: Color.fromRGBO(248, 250, 251, 1),
          actions: <Widget>[
            // const Text.rich(
            //   TextSpan(
            //     children: <TextSpan>[
            //       TextSpan(
            //         text: '06',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Color.fromRGBO(78, 125, 254, 1),
            //             fontSize: 25,
            //             fontFamily: 'SairaSemiCondensed'),
            //       ),
            //       TextSpan(
            //           text: '\n', style: TextStyle(fontSize: 0, height: 0)),
            //       TextSpan(
            //           text: 'DEC',
            //           style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               color: Color.fromRGBO(78, 125, 254, 1),
            //               fontSize: 16,
            //               fontFamily: 'SairaSemiCondensed')),
            //     ],
            //   ),
            // ),
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
                onPressed: () => _scaffoldKey.currentState.openEndDrawer())
          ],
        ));
  }
}
