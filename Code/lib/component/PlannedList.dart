import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nimble_leaves/component/Capsule.dart';
import 'package:nimble_leaves/component/Colors.dart';

class CustomTextStyle {
  static TextStyle heading(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(
        fontSize: 15.0,
        color: CustomColors.active,
        fontWeight: FontWeight.w700);
  }

  static TextStyle text(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(
        fontSize: 14.0,
        color: CustomColors.inactive,
        fontWeight: FontWeight.normal);
  }

  static TextStyle total(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(
        fontSize: 18.0,
        color: CustomColors.inactive,
        fontWeight: FontWeight.w700);
  }
}

class PlannedList extends StatefulWidget {
  PlannedList({
    this.date,
    this.type,
    this.count,
  });
  final DateTime date;
  final String type;
  final double count;

  @override
  PlannedListState createState() {
    return new PlannedListState();
  }
}

class PlannedListState extends State<PlannedList> {
  bool isEdit = false;
  DateTime date;
  final dateFormat = DateFormat("MMMM d, yyyy");
  @override
  Widget build(BuildContext ctxt) {
    double width = MediaQuery.of(ctxt).size.width - 30;
    return new Container(
      width: getwidth(context),
      margin: EdgeInsets.only(bottom: 7),
      padding: EdgeInsets.all(0),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(color: CustomColors.bordergrey, width: 1),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            new BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 3.0,
            ),
          ]),
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              alignment: AlignmentDirectional.center,
              width: getinnerwidth(context),
              child: Text(
                DateFormat.yMMMd().format(widget.date).toString(),
                style: CustomTextStyle.text(context),
              ),
              decoration: new BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: CustomColors.bordergrey, width: 1)))),
          Container(
              padding: EdgeInsets.all(13),
              alignment: AlignmentDirectional.center,
              width: getinnerwidth(context),
              child: Capsule(type: widget.type),
              decoration: new BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: CustomColors.bordergrey, width: 1)))),
          Container(
            padding: EdgeInsets.all(10),
            width: getinnerwidth(context),
            alignment: AlignmentDirectional.center,
            child: Text(
              widget.count.toString(),
              style: CustomTextStyle.text(context),
            ),
          )
        ],
      ),
    );
  }
}

class PlannedListHeading extends StatefulWidget {
  PlannedListHeading({this.totalCount});
  final bool totalCount;
  @override
  PlannedListHeadingState createState() {
    return new PlannedListHeadingState();
  }
}

class PlannedListHeadingState extends State<PlannedListHeading> {
  bool isEdit = false;

  @override
  Widget build(BuildContext ctxt) {
    double width = MediaQuery.of(ctxt).size.width - 30;
    return widget.totalCount
        ? Container(
            width: getwidth(context),
            margin: EdgeInsets.only(top: 0, bottom: 7),
            // margin: EdgeInsets.only(bottom: 0),
            padding: EdgeInsets.all(0),
            decoration: new BoxDecoration(
                color: Colors.white,
                border:
                    new Border.all(color: CustomColors.bordergrey, width: 1),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  new BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 3.0,
                  ),
                ]),
            child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
                    alignment: AlignmentDirectional.centerEnd,
                    width: MediaQuery.of(context).size.width >= 767 &&
                            MediaQuery.of(context).size.width <= 1023
                        ? width / 2.25
                        : MediaQuery.of(context).size.width >= 1024
                            ? width / 3.25
                            : width / 1.52,
                    child: Text(
                      'Total Leave',
                      style: CustomTextStyle.total(context),
                    ),
                    decoration: new BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: CustomColors.bordergrey, width: 1)))),
                Container(
                  padding: EdgeInsets.all(10),
                  width: getinnerwidth(context),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    '4.5',
                    style: CustomTextStyle.total(context),
                  ),
                )
              ],
            ),
          )
        : new Container(
            width: getwidth(context),
            margin: EdgeInsets.only(top: 7, bottom: 7),
            // margin: EdgeInsets.only(bottom: 0),
            padding: EdgeInsets.all(0),
            decoration: new BoxDecoration(
                color: Colors.white,
                border:
                    new Border.all(color: CustomColors.bordergrey, width: 1),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  new BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 3.0,
                  ),
                ]),
            child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: AlignmentDirectional.center,
                    width: getinnerwidth(context),
                    child: Text(
                      'Leave Date',
                      style: CustomTextStyle.heading(context),
                    ),
                    decoration: new BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: CustomColors.bordergrey, width: 1)))),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: AlignmentDirectional.center,
                    width: getinnerwidth(context),
                    child: Text(
                      'Leave Type',
                      style: CustomTextStyle.heading(context),
                    ),
                    decoration: new BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: CustomColors.bordergrey, width: 1)))),
                Container(
                  padding: EdgeInsets.all(10),
                  width: getinnerwidth(context),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'Count',
                    style: CustomTextStyle.heading(context),
                  ),
                )
              ],
            ),
          );
  }
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

double getinnerwidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width - 30;
  if (MediaQuery.of(context).size.width <= 340) {
    return width / 3.03;
  } else if (MediaQuery.of(context).size.width <= 767) {
    return width / 3.03;
  } else if (MediaQuery.of(context).size.width >= 767 &&
      MediaQuery.of(context).size.width <= 1023) {
    return width / 2.8 - 100;
  } else {
    return width / 6.5;
  }
}
