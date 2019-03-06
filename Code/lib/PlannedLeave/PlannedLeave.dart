import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:material_search/material_search.dart';
import 'package:nimble_leaves/component/PlannedList.dart';
import 'package:nimble_leaves/component/Toaster.dart';
import 'package:nimble_leaves/component/menu.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';

class PlannedLeave extends StatefulWidget {
  @override
  _PlannedLeavepage createState() => _PlannedLeavepage();
  final Toaster toast = new Toaster();
}

class _PlannedLeavepage extends State<PlannedLeave>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Animation animation;
  AnimationController controller;
  bool isLoading = true;
  var timeout = const Duration(seconds: 3);
  var ms = const Duration(milliseconds: 5);
  final _formKey = new GlobalKey<FormState>();

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

  Widget build(BuildContext context) {
    return new Scaffold(
      endDrawer: new DrawerOnly(planned: true),
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
                  planned: true,
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
          child: MediaQuery.of(context).size.width >= 1024
              ? new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(bottom: 5),
                                padding: const EdgeInsets.only(
                                    left: 10, top: 4, bottom: 3),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Container(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          new SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.42,
                                            child:
                                                new MaterialSearchInput<String>(
                                              placeholder: 'Employee Name',
                                              results: _names
                                                  .map((String v) =>
                                                      new MaterialSearchResult<
                                                          String>(
                                                        value: v,
                                                        text: "Mr(s). $v",
                                                      ))
                                                  .toList(),
                                              filter: (dynamic value,
                                                  String criteria) {
                                                return value
                                                    .toLowerCase()
                                                    .trim()
                                                    .contains(new RegExp(r'' +
                                                        criteria
                                                            .toLowerCase()
                                                            .trim() +
                                                        ''));
                                              },
                                              onSelect: (dynamic v) {
                                                print(v);
                                              },
                                              validator: (dynamic value) =>
                                                  value == null
                                                      ? 'Required field'
                                                      : null,
                                              formatter: (dynamic v) =>
                                                  'Hello, $v',
                                            ),
                                          ),
                                          Icon(
                                            CustomIcons.dropdown,
                                            color: CustomColors.inactive,
                                            size: 15,
                                          )
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      new Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 20, bottom: 0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.only(
                                  left: 10, top: 4, bottom: 3),
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 4.0,
                                    ),
                                  ],
                                  borderRadius: new BorderRadius.circular(5)),
                              child: TextField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                    hintText: "Leave Reason",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: CustomColors.inactive),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0)),
                                    disabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0)),
                                    errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0))),
                                keyboardType: TextInputType.multiline,
                              ),
                              width: getwidth(context),
                            ),
                          ],
                        ),
                      ),
                      PlannedListHeading(
                        totalCount: false,
                      ),
                      Container(
                          padding: EdgeInsets.only(bottom: 15),
                          height: 230,
                          child: SingleChildScrollView(
                              child: Column(
                            children: <Widget>[
                              PlannedList(
                                date: DateTime.now(),
                                type: 'planned',
                                count: 0.5,
                              ),
                              PlannedList(
                                date: DateTime.now(),
                                type: 'planned',
                                count: 0.5,
                              ),
                              PlannedList(
                                date: DateTime.now(),
                                type: 'planned',
                                count: 0.5,
                              ),
                              PlannedList(
                                date: DateTime.now(),
                                type: 'planned',
                                count: 0.5,
                              ),
                              PlannedList(
                                date: DateTime.now(),
                                type: 'planned',
                                count: 0.5,
                              ),
                            ],
                          ))),
                      PlannedListHeading(totalCount: true),
                    ]),
                    new Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: 570,
                      margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4.0,
                            ),
                          ],
                          borderRadius: new BorderRadius.circular(5)),
                      child: CalendarCarousel(
                        onDayPressed: null,
                        daysTextStyle: TextStyle(
                            color: CustomColors.inactive,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        height: 420.0,
                        headerTextStyle: TextStyle(
                            color: CustomColors.active,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        selectedDateTime: DateTime.now(),
                        weekendTextStyle: TextStyle(
                            color: CustomColors.inactive,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        weekdayTextStyle: TextStyle(
                            color: CustomColors.inactive,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )
              : new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 12, top: 20, bottom: 0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.only(
                                  left: 10, top: 4, bottom: 3),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new SizedBox(
                                          width: MediaQuery.of(context)
                                                          .size
                                                          .width >=
                                                      767 &&
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width <=
                                                      1023
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  290
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  68,
                                          child:
                                              new MaterialSearchInput<String>(
                                            placeholder: 'Employee Name',
                                            results: _names
                                                .map((String v) =>
                                                    new MaterialSearchResult<
                                                        String>(
                                                      value: v,
                                                      text: "Mr(s). $v",
                                                    ))
                                                .toList(),
                                            filter: (dynamic value,
                                                String criteria) {
                                              return value
                                                  .toLowerCase()
                                                  .trim()
                                                  .contains(new RegExp(r'' +
                                                      criteria
                                                          .toLowerCase()
                                                          .trim() +
                                                      ''));
                                            },
                                            onSelect: (dynamic v) {
                                              print(v);
                                            },
                                            validator: (dynamic value) =>
                                                value == null
                                                    ? 'Required field'
                                                    : null,
                                            formatter: (dynamic v) =>
                                                'Hello, $v',
                                          ),
                                        ),
                                        Icon(
                                          CustomIcons.dropdown,
                                          color: CustomColors.inactive,
                                          size: 15,
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    new Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            width: getwidth(context),
                            margin: EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.only(
                                left: 10, top: 4, bottom: 3),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4.0,
                                  ),
                                ],
                                borderRadius: new BorderRadius.circular(5)),
                            child: TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                  hintText: "Leave Reason",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: CustomColors.inactive),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0))),
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      width: getwidth(context),
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4.0,
                            ),
                          ],
                          borderRadius: new BorderRadius.circular(5)),
                      child: CalendarCarousel(
                        onDayPressed: null,
                        daysTextStyle: TextStyle(
                            color: CustomColors.inactive,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        height: 420.0,
                        headerTextStyle: TextStyle(
                            color: CustomColors.active,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        selectedDateTime: DateTime.now(),
                        weekendTextStyle: TextStyle(
                            color: CustomColors.inactive,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        weekdayTextStyle: TextStyle(
                            color: CustomColors.inactive,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    PlannedListHeading(
                      totalCount: false,
                    ),
                    PlannedList(
                      date: DateTime.now(),
                      type: 'planned',
                      count: 0.5,
                    ),
                    PlannedList(
                      date: DateTime.now(),
                      type: 'planned',
                      count: 0.5,
                    ),
                    PlannedListHeading(totalCount: true),
                  ],
                ),
        ),
      ),
      floatingActionButton: MediaQuery.of(context).size.width <= 1023
          ? new FloatingActionButton(
              onPressed: () {
                widget.toast.showFlushbar(
                    context,
                    "Planned leave saved successfully.",
                    "",
                    false,
                    CustomIcons.verified,
                    true);
              },
              child: new Icon(
                CustomIcons.tick,
                color: CustomColors.inactive,
              ),
              backgroundColor: CustomColors.grey,
            )
          : null,
    );
  }

  double getwidth(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 340) {
      return MediaQuery.of(context).size.width - 30;
    } else if (MediaQuery.of(context).size.width <= 767) {
      return MediaQuery.of(context).size.width - 30;
    } else if (MediaQuery.of(context).size.width >= 767 &&
        MediaQuery.of(context).size.width <= 1023) {
      return MediaQuery.of(context).size.width * 0.8 - 100;
    } else {
      return MediaQuery.of(context).size.width / 2.2;
    }
  }
}
