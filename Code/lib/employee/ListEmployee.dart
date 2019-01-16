import 'dart:async';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/DetailCard.dart';
import 'package:nimble_leaves/component/LoadingShimmer.dart';
import 'package:nimble_leaves/component/menu.dart';
import 'package:nimble_leaves/component/toaster.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';
import 'package:nimble_leaves/employee/AddEmployee.dart';
import 'package:material_search/material_search.dart';

const active = const Color.fromRGBO(78, 125, 254, 1);
const greydark = const Color.fromRGBO(119, 140, 161, 1);
const greylight = const Color.fromRGBO(237, 237, 237, 1);

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key, this.duration}) : super(key: key);

  final Duration duration;
  final Toaster toast = new Toaster();

  @override
  _SecondScreenpage createState() => _SecondScreenpage();
}

class _SecondScreenpage extends State<SecondScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _names = [
    'Igor Minar',
    'Brad Green',
    'Dave Geddes',
    'Naomi Black',
    'Greg Weber',
    'Dean Sofer',
    'Wes Alvaro',
    'John Scott',
    'Daniel Nadasi',
  ];
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
  final _formKey = new GlobalKey<FormState>();

  Widget build(BuildContext context) {
    startTimeout(1500);
    return new Scaffold(
      endDrawer: new DrawerOnly(employee: true),
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
      body: new SingleChildScrollView(
        key: null,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        padding:
                            const EdgeInsets.only(left: 10, top: 4, bottom: 3),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                              ),
                            ],
                            borderRadius: new BorderRadius.circular(5)),
                        width: getwidth(context),
                        // MediaQuery.of(context).size.width < 767
                        //     ? MediaQuery.of(context).size.width * 0.76
                        //     : MediaQuery.of(context).size.width * 0.88,
                        child: new Form(
                          key: _formKey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Icon(
                                    Icons.search,
                                    color: greydark,
                                  ),
                                  new SizedBox(
                                    width: MediaQuery.of(context).size.width <=
                                            330
                                        ? MediaQuery.of(context).size.width *
                                            0.4
                                        : MediaQuery.of(context).size.width *
                                            .6,
                                    child:
                                        //  new TextField(
                                        //   keyboardType: TextInputType.text,
                                        //   decoration: new InputDecoration(
                                        //     border: InputBorder.none,
                                        //     hintText: 'Search',
                                        //   ),
                                        // ),

                                        new MaterialSearchInput<String>(
                                      placeholder: ' Search',
                                      results: _names
                                          .map((String v) =>
                                              new MaterialSearchResult<String>(
                                                value: v,
                                                text: "Mr(s). $v",
                                              ))
                                          .toList(),
                                      filter: (dynamic value, String criteria) {
                                        return value
                                            .toLowerCase()
                                            .trim()
                                            .contains(new RegExp(r'' +
                                                criteria.toLowerCase().trim() +
                                                ''));
                                      },
                                      onSelect: (dynamic v) {
                                        print(v);
                                      },
                                      validator: (dynamic value) =>
                                          value == null
                                              ? 'Required field'
                                              : null,
                                      formatter: (dynamic v) => 'Hello, $v',
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 10, right: 0),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                              ),
                            ],
                            borderRadius: new BorderRadius.circular(5)),
                        child: new PopupMenuButton(
                            key: null,
                            offset: Offset(0.0, 200),
                            icon: Icon(
                              CustomIcons.filter,
                              color: greydark,
                            ),
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                                  new PopupMenuItem<String>(
                                      child: const Text('Doge'), value: 'Doge'),
                                  new PopupMenuItem<String>(
                                      child: const Text('Lion'), value: 'Lion'),
                                ],
                            onSelected: (_) {}),

                        //  new IconButton(
                        //     icon: Icon(
                        //       CustomIcons.filter,
                        //       color: greydark,
                        //     ),
                        //     onPressed: () {
                        //       dynamic state = _scaffoldKey.currentState;
                        //       state.showButtonMenu();
                        //     })
                      )
                    ],
                  )),
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
                          : Container(height: 0),
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
      floatingActionButton: MediaQuery.of(context).size.width <= 1023
          ? new FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context, child: new CustomTheme(AddEmployee()));
              },
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
