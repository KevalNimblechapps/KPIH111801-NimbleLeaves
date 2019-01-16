import 'dart:async';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/menu.dart';
import 'package:nimble_leaves/component/toaster.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';

const active = const Color.fromRGBO(78, 125, 254, 1);
const greydark = const Color.fromRGBO(119, 140, 161, 1);
const greylight = const Color.fromRGBO(237, 237, 237, 1);

class PlannedLeave extends StatefulWidget {
  PlannedLeave({
    Key key,
    this.duration,
  }) : super(key: key);

  final Duration duration;

  final Toaster toast = new Toaster();

  @override
  _PlannedLeavepage createState() => _PlannedLeavepage();
}

class _PlannedLeavepage extends State<PlannedLeave>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Animation animation;
  AnimationController controller;
  bool isLoading = true;
  var timeout = const Duration(seconds: 3);
  var ms = const Duration(milliseconds: 5);

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    setState(() {
      isLoading = false;
    });
  }

  initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);

    animation = Tween(begin: 0.0, end: 25.0).animate(controller);
    controller.forward();
  }

  Flushbar flush;

  Widget build(BuildContext context) {
    final button = new PopupMenuButton(
        key: null,
        offset: Offset(0, 200),
        itemBuilder: (_) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  child: const Text('Doge'), value: 'Doge'),
              new PopupMenuItem<String>(
                  child: const Text('Lion'), value: 'Lion'),
            ],
        onSelected: (_) {});

    final tile = new ListTile(
        title: new Text('Doge or lion?'),
        contentPadding: EdgeInsets.only(bottom: 20),
        trailing: button,
        onTap: () {
          // This is a hack because _PopupMenuButtonState is private.
          dynamic state = _scaffoldKey.currentState;
          state.showButtonMenu();
        });
    startTimeout(1500);
    return new Scaffold(
      endDrawer: new DrawerOnly(
        planned: "",
      ),
      key: _scaffoldKey,
      appBar: new AppBar(
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
          leading: new Container(
            child: MediaQuery.of(context).size.width >= 768
                ? Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        height: 0,
                        width: 0,
                      ),
                      Positioned(
                        height: 20,
                        top: 22,
                        left: -27,
                        child: Image.asset('assests/images/logo-ipad.png',
                            width: 200, height: 100, fit: BoxFit.contain),
                      )
                    ],
                  )
                : Image.asset(
                    'assests/images/logo.png',
                  ),
            padding: EdgeInsets.only(left: 5, top: 5),
          ),
          title: MediaQuery.of(context).size.width <= 767
              ? null
              : new DrawerOnly(),
          backgroundColor: Color.fromRGBO(248, 250, 251, 1),
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
                            fontSize: 27,
                            height: 1,
                            fontFamily: 'SairaSemiCondensed'),
                      ),
                      new Text(
                        'DEC',
                        style: TextStyle(
                            color: Color.fromRGBO(78, 125, 254, 1),
                            fontSize: 18,
                            height: 0.2,
                            fontFamily: 'SairaSemiCondensed'),
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(CustomIcons.menunew),
                      color: Colors.blueGrey,
                      onPressed: () =>
                          _scaffoldKey.currentState.openEndDrawer()),
                  Padding(
                    padding: EdgeInsets.only(right: 4),
                  )
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
                    padding: EdgeInsets.only(right: 15),
                  )
                ]),
      body: new SingleChildScrollView(key: null, child: tile),
      floatingActionButton: MediaQuery.of(context).size.width <= 1023
          ? new FloatingActionButton(
              onPressed: null,
              tooltip: 'Add',
              child: new Icon(CustomIcons.add),
              backgroundColor: active,
            )
          : null,
    );
  }

  double getwidth(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 340) {
      return MediaQuery.of(context).size.width * 0.72;
    } else if (MediaQuery.of(context).size.width <= 767) {
      return MediaQuery.of(context).size.width * 0.76;
    } else if (MediaQuery.of(context).size.width >= 767 &&
        MediaQuery.of(context).size.width <= 1023) {
      return MediaQuery.of(context).size.width * 0.88;
    } else {
      return MediaQuery.of(context).size.width * 0.912;
    }
  }
}
