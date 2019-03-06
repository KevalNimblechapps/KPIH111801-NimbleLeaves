import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:nimble_leaves/component/SearchBar.dart';
import 'package:nimble_leaves/component/DetailCard.dart';
import 'package:nimble_leaves/component/LoadingShimmer.dart';
import 'package:nimble_leaves/component/menu.dart';
import 'package:nimble_leaves/component/toaster.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';
import 'package:nimble_leaves/employee/AddEmployee.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key, this.duration}) : super(key: key);

  final Duration duration;
  final Toaster toast = new Toaster();

  @override
  _SecondScreenpage createState() => _SecondScreenpage();
}

class _SecondScreenpage extends State<SecondScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  bool showfloatingbutton = true;
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

  Widget build(BuildContext context) {
    startTimeout(1500);
    return new Scaffold(
      endDrawer: new DrawerOnly(employee: true),
      key: _scaffoldKey1,
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
                : Image.asset('assests/images/logo.png'),
            padding: EdgeInsets.only(left: 5, top: 5),
          ),
          title: MediaQuery.of(context).size.width <= 767
              ? null
              : new DrawerOnly(
                  employee: true,
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
                          _scaffoldKey1.currentState.openEndDrawer()),
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
              Searchbar(
                onfilterclick: null,
              ),
              isLoading
                  ? LoadingShimmer()
                  : new Column(children: <Widget>[
                      // new Text(
                      //   'OOPS!',
                      //   style: TextStyle(
                      //       color: greydark,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 24,
                      //       fontFamily: 'SairaSemiCondensed'),
                      // ),
                      // Text('Nothing found here.',
                      //     style: TextStyle(
                      //         color: greydark,
                      //         fontWeight: FontWeight.normal,
                      //         fontSize: 18,
                      //         height: 0.8,
                      //         fontFamily: 'SairaSemiCondensed')),
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 20),
                      // ),
                      MediaQuery.of(context).size.width >= 767
                          ? DetailHeading()
                          : Container(
                              height: 0, width: 0, padding: EdgeInsets.zero),

                      MediaQuery.of(context).size.width >= 1024
                          ? AddEmployee(
                              code: '001',
                              editor: true,
                              name: '',
                              email: '',
                              dob: '',
                              sposename: '',
                              sposedob: '',
                              onDelete: null)
                          : Text(''),
                      MediaQuery.of(context).size.width >= 1024
                          ? AddEmployee(
                              code: '001',
                              name: 'Dhruvit Patel',
                              email: 'dhruvit@nimblechapps.com',
                              dob: '21 Dec, 1987',
                              sposename: 'Kamini Patel',
                              sposedob: '13 Nov, 1991',
                              onDelete: () {
                                widget.toast.showFlushbar(
                                    context,
                                    "Employee deleted successfully",
                                    "",
                                    true,
                                    CustomIcons.verified,
                                    true);
                              })
                          : new DetailCard(
                              code: '001',
                              name: 'Dhruvit Patel',
                              email: 'dhruvit@nimblechapps.com',
                              dob: '21 Dec, 1987',
                              sposename: 'Kamini Patel',
                              sposedob: '13 Nov, 1991',
                              onDelete: () {
                                widget.toast.showFlushbar(
                                    context,
                                    "Employee deleted successfully",
                                    "",
                                    false,
                                    CustomIcons.verified,
                                    true);
                              }),
                      MediaQuery.of(context).size.width >= 1024
                          ? AddEmployee(
                              code: '002',
                              name: 'Braj Mohanpal',
                              email: 'braj@nimblechapps.com',
                              dob: '21 Dec, 1990',
                              sposename: '',
                              sposedob: '',
                              onDelete: () {
                                widget.toast.showFlushbar(
                                    context,
                                    "Employee deleted successfully",
                                    "",
                                    true,
                                    CustomIcons.verified,
                                    true);
                              })
                          : new DetailCard(
                              code: '002',
                              name: 'Braj Mohanpal',
                              email: 'braj@nimblechapps.com',
                              dob: '21 Dec, 1990',
                              sposename: '',
                              sposedob: '',
                              onDelete: () {
                                widget.toast.showFlushbar(
                                    context,
                                    "Employee deleted successfully",
                                    "",
                                    false,
                                    CustomIcons.verified,
                                    true);
                              }),
                      // new DetailCard(),
                      // new DetailCard()
                    ]),
            ],
          ),
        ),
      ),
      floatingActionButton:
          MediaQuery.of(context).size.width <= 1023 && showfloatingbutton
              ? new FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        child: new CustomTheme(AddEmployee()));
                  },
                  tooltip: 'Add',
                  child: new Icon(CustomIcons.add),
                  backgroundColor: CustomColors.active,
                )
              : null,
    );
  }

  void floatingbutton() {
    print('object');
    setState(() {
      showfloatingbutton = false;
    });
  }
}
