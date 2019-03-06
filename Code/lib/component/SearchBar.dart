import 'dart:async';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:nimble_leaves/UnplannedLeave/sliderdemo.dart';
import 'package:nimble_leaves/component/Capsule.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:nimble_leaves/component/toaster.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';
import 'package:nimble_leaves/employee/ListEmployee.dart';

class Searchbar extends StatefulWidget {
  Searchbar({this.onfilterclick, this.duration, this.parent});

  final Duration duration;
  final dynamic onfilterclick;
  final Toaster toast = Toaster();
  final String parent;
  @override
  _Searchbarpage createState() => _Searchbarpage();
}

class _Searchbarpage extends State<Searchbar> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showfilter = true;
  VoidCallback onClosing;
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
  int _radioValue = 0;
  Animation animation;
  AnimationController controller;
  bool isLoading = true;
  var timeout = const Duration(seconds: 3);
  var ms = const Duration(milliseconds: 5);
  final _formKey = GlobalKey<FormState>();
  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return Timer(duration, handleTimeout);
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
  String monthvalue = 'Month';
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10, top: 4, bottom: 3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5)),
              width: getwidth(context),
              // MediaQuery.of(context).size.width < 767
              //     ? MediaQuery.of(context).size.width * 0.76
              //     : MediaQuery.of(context).size.width * 0.88,
              child: Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: CustomColors.greydark,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width <= 330
                              ? MediaQuery.of(context).size.width * 0.4
                              : MediaQuery.of(context).size.width * .6,
                          child:
                              //     TextField(
                              //   keyboardType: TextInputType.text,
                              //   decoration:    InputDecoration(
                              //     border: InputBorder.none,
                              //     hintText: 'Search',
                              //   ),
                              // ),

                              MaterialSearchInput<String>(
                            placeholder: ' Search',
                            results: _names
                                .map((String v) => MaterialSearchResult<String>(
                                      value: v,
                                      text: "Mr(s). $v",
                                    ))
                                .toList(),
                            filter: (dynamic value, String criteria) {
                              return value.toLowerCase().trim().contains(RegExp(
                                  r'' + criteria.toLowerCase().trim() + ''));
                            },
                            onSelect: (dynamic v) {
                              print(v);
                            },
                            validator: (dynamic value) =>
                                value == null ? 'Required field' : null,
                            formatter: (dynamic v) => 'Hello, $v',
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ),
            showfilter
                ? Container(
                    margin: const EdgeInsets.only(left: 10, right: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                        icon: Icon(
                          CustomIcons.filter,
                          color: CustomColors.greydark,
                        ),
                        onPressed: showbottomsheet),
                  )
                : Padding(
                    padding: EdgeInsets.all(0),
                  )
          ],
        ));
  }

  double getwidth(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 340) {
      return MediaQuery.of(context).size.width * 0.72;
    } else if (MediaQuery.of(context).size.width <= 767) {
      return MediaQuery.of(context).size.width * 0.75;
    } else if (MediaQuery.of(context).size.width >= 767 &&
        MediaQuery.of(context).size.width <= 1023) {
      return MediaQuery.of(context).size.width * 0.88;
    } else {
      return MediaQuery.of(context).size.width * 0.912;
    }
  }

  void showbottomsheet() {
    widget.onfilterclick;
    setState(() {
      showfilter = false;
    });

    showBottomSheet<void>(
        context: context,
        builder: widget.parent == "unplanned"
            ? (BuildContext context) {
                return GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height - 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Image.asset(
                                  'assests/images/shadow.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 15, right: 0, top: 0, bottom: 0),
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            CustomIcons.filter,
                                            size: 16,
                                            color: CustomColors.greydark,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10)),
                                          Text(
                                            'Filter your search',
                                            style: TextStyle(
                                                color: CustomColors.greydark,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          MaterialButton(
                                              padding: EdgeInsets.all(0),
                                              highlightColor:
                                                  Colors.transparent,
                                              highlightElevation: 0,
                                              splashColor: Colors.transparent,
                                              child: Text(
                                                'Clear All',
                                                style: TextStyle(
                                                    color:
                                                        CustomColors.greydark,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              onPressed: null),
                                          MaterialButton(
                                            splashColor: Colors.white,
                                            highlightColor: Colors.white,
                                            height: 50,
                                            elevation: 0,
                                            minWidth: 30,
                                            padding: EdgeInsets.all(0),
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {
                                                showfilter = true;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Icon(CustomIcons.close_sm),
                                          )
                                        ],
                                      )
                                    ])),
                            Image.asset(
                              'assests/images/shadow.png',
                              fit: BoxFit.fitWidth,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 10),
                                      child: Text('Sick / Emergency Leave',
                                          style: TextStyle(
                                              color: CustomColors.inactive,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500))),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Capsule(
                                            type: 'sick',
                                          ),
                                          Capsule(
                                            type: 'emergency',
                                          )
                                        ],
                                      )),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Text('Late Coming (Min)',
                                          style: TextStyle(
                                              color: CustomColors.greydark,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500))),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 15, left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text('0',
                                            style: TextStyle(
                                                color: CustomColors.greydark,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                62,
                                            child: SliderDemo()),
                                        Text('150',
                                            style: TextStyle(
                                                color: CustomColors.greydark,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Text('Early Going (Min)',
                                          style: TextStyle(
                                              color: CustomColors.greydark,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500))),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 15, left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text('0',
                                            style: TextStyle(
                                                color: CustomColors.greydark,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                62,
                                            child: SliderDemo()),
                                        Text('150',
                                            style: TextStyle(
                                                color: CustomColors.greydark,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15, top: 15, right: 15),
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: CustomColors.greylight,
                                                width: 1))),
                                    child: MaterialButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: null,
                                        child: Row(children: <Widget>[
                                          Text('Quick search (Min)',
                                              style: TextStyle(
                                                  color: CustomColors.greydark,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 13),
                                              child: Icon(
                                                CustomIcons.sorting,
                                                color: CustomColors.inactive,
                                                size: 16,
                                              ))
                                        ])),
                                  ),
                                ]),
                          ]),
                    ));
              }
            : (BuildContext context) {
                final button = PopupMenuButton(
                    icon: null,
                    child: OutlineButton(
                      padding: EdgeInsets.zero,
                      onPressed: null,
                      borderSide: BorderSide(
                          color: CustomColors.bordergrey, width: 1.8),
                      child: Text(
                        monthvalue,
                        style: TextStyle(
                            color: CustomColors.greydark,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                              child: const Text('Jan'), value: 'Jan'),
                          PopupMenuItem<String>(
                              child: const Text('Feb'), value: 'Feb'),
                          PopupMenuItem<String>(
                              child: const Text('March'), value: 'March'),
                          PopupMenuItem<String>(
                              child: const Text('Apr'), value: 'Apr'),
                          PopupMenuItem<String>(
                              child: const Text('May'), value: 'May'),
                          PopupMenuItem<String>(
                              child: const Text('June'), value: 'June'),
                        ],
                    onSelected: (value) {
                      monthvalue = value;
                    });
                return GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height - 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Image.asset(
                                  'assests/images/shadow.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 15, right: 0, top: 0, bottom: 0),
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            CustomIcons.filter,
                                            size: 16,
                                            color: CustomColors.greydark,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10)),
                                          Text(
                                            'Filter your search',
                                            style: TextStyle(
                                                color: CustomColors.greydark,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          MaterialButton(
                                              padding: EdgeInsets.all(0),
                                              highlightColor:
                                                  Colors.transparent,
                                              highlightElevation: 0,
                                              splashColor: Colors.transparent,
                                              child: Text(
                                                'Clear All',
                                                style: TextStyle(
                                                    color:
                                                        CustomColors.greydark,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              onPressed: null),
                                          MaterialButton(
                                            splashColor: Colors.white,
                                            highlightColor: Colors.white,
                                            height: 50,
                                            elevation: 0,
                                            minWidth: 30,
                                            padding: EdgeInsets.all(0),
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {
                                                showfilter = true;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Icon(CustomIcons.close_sm),
                                          )
                                        ],
                                      )
                                    ])),
                            Image.asset(
                              'assests/images/shadow.png',
                              fit: BoxFit.fitWidth,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Radio(
                                    activeColor: CustomColors.active,
                                    value: 0,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  Text('Employee DOB',
                                      style: TextStyle(
                                          color: CustomColors.greydark,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Radio(
                                    activeColor: CustomColors.active,
                                    value: 1,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  Text('Spose DOB',
                                      style: TextStyle(
                                          color: CustomColors.greydark,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))
                                ]),
                            Container(height: 40, width: 110, child: button),
                            Padding(padding: EdgeInsets.only(top: 15)),
                          ]),
                    ));
              });
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _radioValue;
          break;
        case 1:
          _radioValue;
          break;
        case 2:
          _radioValue = 1;
          break;
      }
    });
  }
}
