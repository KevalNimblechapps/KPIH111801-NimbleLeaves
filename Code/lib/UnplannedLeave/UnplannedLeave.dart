import 'dart:async';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nimble_leaves/UnplannedLeave/AddUnplannedLeave.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:nimble_leaves/component/LoadingShimmer.dart';
import 'package:nimble_leaves/component/SearchBar.dart';
import 'package:nimble_leaves/component/UnplannedCard.dart';
import 'package:nimble_leaves/component/menu.dart';
import 'package:nimble_leaves/component/toaster.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';

class UnplannedLeave extends StatefulWidget {
  UnplannedLeave({Key key, this.duration}) : super(key: key);

  final Duration duration;
  final Toaster toast = new Toaster();

  @override
  _UnplannedLeavepage createState() => _UnplannedLeavepage();
}

class _UnplannedLeavepage extends State<UnplannedLeave>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Animation animation;
  AnimationController controller;
  bool isLoading = true;
  var timeout = const Duration(seconds: 0);
  var ms = const Duration(milliseconds: 0);

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
    startTimeout(1500);
    return new Scaffold(
      endDrawer: new DrawerOnly(unplanned: true),
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
                        height: 40,
                        top: 12,
                        left: 10,
                        child: Image.asset('assests/images/logo-ipad.png',
                            width: 200, height: 40, fit: BoxFit.contain),
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
              : new DrawerOnly(
                  unplanned: true,
                ),
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
      body: new SingleChildScrollView(
        key: null,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Searchbar(parent: 'unplanned'),
              isLoading
                  ? UnplannedLoadingShimmer()
                  : new Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                      ),
                      new Text(
                        'OOPS!',
                        style: TextStyle(
                            color: CustomColors.greydark,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'SairaSemiCondensed'),
                      ),
                      Text('Nothing found here.',
                          style: TextStyle(
                              color: CustomColors.greydark,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              height: 0.8,
                              fontFamily: 'SairaSemiCondensed')),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      MediaQuery.of(context).size.width >= 768
                          ? UnplannedHeading()
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      UnplannedCard(
                          name: 'Dhruvit Patel',
                          type: "planned",
                          reason:
                              'One of my Relative passed away, so i am not able to come today. I will manage my work tommorrow.',
                          onDelete: () {
                            widget.toast.showFlushbar(
                                context,
                                "Unplanned Leave deleted successfully",
                                "",
                                true,
                                CustomIcons.verified,
                                true);
                          }),
                      UnplannedCard(
                          name: 'Kaushik Ravalia',
                          type: "unplanned",
                          reason: 'Not Feeling Well due to fever',
                          onDelete: () {
                            widget.toast.showFlushbar(
                                context,
                                "Unplanned Leave deleted successfully",
                                "",
                                true,
                                CustomIcons.verified,
                                true);
                          }),
                    ]),
            ],
          ),
        ),
      ),
      floatingActionButton: MediaQuery.of(context).size.width <= 1023
          ? new FloatingActionButton(
              onPressed: () {
                showDialog(context: context, child: new AddUnplannedLeave());
              },
              child: new Icon(CustomIcons.add),
              backgroundColor: CustomColors.active,
            )
          : null,
    );
  }
}
