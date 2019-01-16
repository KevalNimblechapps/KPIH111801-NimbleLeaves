import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';
import 'package:nimble_leaves/employee/AddEmployee.dart';

const kShrineBrown900 = const Color.fromRGBO(78, 125, 254, 1);
const inactive = const Color.fromRGBO(119, 140, 161, 1);
const active = const Color.fromRGBO(78, 125, 254, 1);
const bordergrey = const Color.fromRGBO(151, 151, 151, 0.5);

class CustomTextStyle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .display4
        .copyWith(fontSize: 16.0, color: inactive, fontWeight: FontWeight.w300);
  }

  static TextStyle title(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .display3
        .copyWith(fontSize: 15.0, color: active, fontWeight: FontWeight.w600);
  }

  static TextStyle list(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .display3
        .copyWith(fontSize: 14.0, color: inactive, fontWeight: FontWeight.w500);
  }
}

class DetailCard extends StatefulWidget {
  DetailCard(
      {this.code,
      this.name,
      this.email,
      this.dob,
      this.sposename,
      this.onDelete,
      this.sposedob});
  final String code;
  final String name;
  final String email;
  final String dob;
  final String sposename;
  final String sposedob;
  final VoidCallback onDelete;
  @override
  DetailCardState createState() {
    return new DetailCardState();
  }
}

class DetailCardState extends State<DetailCard> {
  bool isEdit = false;

  @override
  Widget build(BuildContext ctxt) {
    double width = MediaQuery.of(ctxt).size.width - 30;
    return new Container(
      width: MediaQuery.of(ctxt).size.width - 30,
      margin: EdgeInsets.only(bottom: 20),
      padding: MediaQuery.of(context).size.width <= 767
          ? EdgeInsets.all(15)
          : EdgeInsets.only(left: 15, right: 0),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(color: bordergrey, width: 1),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            new BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 3.0,
            ),
          ]),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MediaQuery.of(context).size.width <= 767
            ? Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                widget.code.toString(),
                                style: CustomTextStyle.display5(ctxt),
                              ),
                              margin: EdgeInsets.only(bottom: 2.0),
                            ),
                            Container(
                              child: Text(widget.name,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: inactive,
                                      fontWeight: FontWeight.w300)),
                              margin: EdgeInsets.only(bottom: 5.0),
                            ),
                            Container(
                              child: Text(widget.email,
                                  style: CustomTextStyle.display5(ctxt)),
                              margin: EdgeInsets.only(bottom: 5.0),
                            ),
                            Container(
                              child: Text(widget.dob,
                                  style: CustomTextStyle.display5(ctxt)),
                              margin: EdgeInsets.only(bottom: 5.0),
                            ),
                            widget.sposename == ''
                                ? Container(height: 0)
                                : Container(
                                    child: new Row(
                                      children: <Widget>[
                                        Text(widget.sposename,
                                            style:
                                                CustomTextStyle.display5(ctxt)),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 10)),
                                        Icon(CustomIcons.dot,
                                            size: 7, color: inactive)
                                      ],
                                    ),
                                    margin: EdgeInsets.only(bottom: 5.0),
                                  ),
                            widget.sposedob == ''
                                ? Container(height: 0)
                                : Container(
                                    child: new Row(
                                      children: <Widget>[
                                        Text(
                                          widget.sposedob,
                                          style: CustomTextStyle.display5(ctxt),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 10)),
                                        Icon(CustomIcons.dot,
                                            size: 7, color: inactive)
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // Text('jfnjkdfk'),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              child: new SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: new IconButton(
                                      padding: new EdgeInsets.all(0.0),
                                      color: Colors.transparent,
                                      icon: new Icon(CustomIcons.edit,
                                          size: 18.0, color: inactive),
                                      onPressed: () {
                                        showDialog(
                                            context: ctxt,
                                            child: new AddEmployee(
                                              isEdit: true,
                                            ));
                                      })),
                              margin: EdgeInsets.only(right: 20.0, bottom: 5),
                            ),

                            Container(
                              child: new SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: new IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    color: Colors.transparent,
                                    icon: new Icon(CustomIcons.delete,
                                        size: 18.0, color: inactive),
                                    onPressed: widget.onDelete,
                                  )),
                              margin: EdgeInsets.only(bottom: 5.0),
                            ),
                            // new Text('kjfkdf'),
                            // new IconButton(
                            //   padding: EdgeInsets.all(0),
                            //   icon: Icon(
                            //     Icons.close,
                            //     size: 30,
                            //     color: Colors.red,
                            //   ),
                            // )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            : Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 48,
                      width: width >= 768 && width <= 1023
                          ? width * 0.075
                          : width * 0.095,
                      alignment: AlignmentDirectional.centerStart,
                      padding: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.white, width: 0))),
                      child:
                          Text(widget.code, style: CustomTextStyle.list(ctxt)),
                    ),
                    Container(
                      width: width >= 768 && width <= 1023
                          ? width * 0.18
                          : width * 0.18,
                      alignment: AlignmentDirectional.centerStart,
                      height: 48,
                      padding: EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.white, width: 0))),
                      child:
                          Text(widget.name, style: CustomTextStyle.list(ctxt)),
                    ),
                    Container(
                      width: width >= 768 && width <= 1023
                          ? width * 0.22
                          : width * 0.27,
                      alignment: AlignmentDirectional.centerStart,
                      height: 48,
                      padding: EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.white, width: 0))),
                      child:
                          Text(widget.email, style: CustomTextStyle.list(ctxt)),
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      height: 48,
                      width: width >= 768 && width <= 1023
                          ? width * 0.13
                          : width * 0.15,
                      padding: EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.white, width: 0))),
                      child:
                          Text(widget.dob, style: CustomTextStyle.list(ctxt)),
                    ),
                    MediaQuery.of(context).size.width >= 1024
                        ? Container(
                            alignment: AlignmentDirectional.centerStart,
                            height: 48,
                            width: width * 0.13,
                            padding: EdgeInsets.only(right: 15, left: 15),
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    end: BorderSide(
                                        color: Colors.white, width: 0))),
                            child: Text(widget.sposename,
                                style: CustomTextStyle.list(ctxt)),
                          )
                        : Container(width: 0, height: 0),
                    Container(
                      alignment: AlignmentDirectional.center,
                      height: 48,
                      width: width >= 768 && width <= 1023
                          ? width * 0.13
                          : width * 0.15,
                      padding: EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.white, width: 0))),
                      child: Text(widget.sposedob,
                          style: CustomTextStyle.list(ctxt)),
                    ),
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: 48,
                        width: width >= 768 && width <= 1023
                            ? width * 0.11
                            : width * 0.13,
                        padding: EdgeInsets.only(right: 15, left: 15),
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end:
                                    BorderSide(color: Colors.white, width: 0))),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Text('jfnjkdfk'),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              child: new SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: new IconButton(
                                      padding: new EdgeInsets.all(0.0),
                                      color: Colors.transparent,
                                      icon: new Icon(CustomIcons.edit,
                                          size: 18.0, color: inactive),
                                      onPressed: () {
                                        showDialog(
                                            context: ctxt,
                                            child: new AddEmployee(
                                              isEdit: true,
                                            ));
                                      })),
                              margin: EdgeInsets.only(right: 20.0, bottom: 5),
                            ),

                            Container(
                              child: new SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: new IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    color: Colors.transparent,
                                    icon: new Icon(CustomIcons.delete,
                                        size: 18.0, color: inactive),
                                    onPressed: widget.onDelete,
                                  )),
                              margin: EdgeInsets.only(bottom: 5.0),
                            ),
                          ],
                        )),
                  ],
                ),
              )
      ]),
    );
  }
}

class DetailHeading extends StatefulWidget {
  @override
  DetailHeadingState createState() {
    return new DetailHeadingState();
  }
}

class DetailHeadingState extends State<DetailHeading> {
  bool isEdit = false;

  @override
  Widget build(BuildContext ctxt) {
    double width = MediaQuery.of(ctxt).size.width - 30;
    return new Container(
      width: MediaQuery.of(ctxt).size.width - 30,
      margin: EdgeInsets.only(bottom: 11),
      padding: MediaQuery.of(context).size.width <= 767
          ? EdgeInsets.all(15)
          : EdgeInsets.only(left: 15, right: 0),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(color: bordergrey, width: 1),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            new BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 3.0,
            ),
          ]),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: width >= 768 && width <= 1023
                      ? width * 0.075
                      : width * 0.095,
                  padding: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          end: BorderSide(color: bordergrey, width: 1))),
                  child: MaterialButton(
                    height: 10,
                    minWidth: 50,
                    padding: EdgeInsets.all(0),
                    highlightColor: Colors.transparent,
                    onPressed: null,
                    child: Row(
                      children: <Widget>[
                        Text('Code', style: CustomTextStyle.title(ctxt)),
                        Padding(padding: EdgeInsets.only(left: 7)),
                        Icon(CustomIcons.sorting, size: 15, color: active)
                      ],
                    ),
                  )),
              Container(
                width:
                    width >= 768 && width <= 1023 ? width * 0.18 : width * 0.20,
                alignment: AlignmentDirectional.centerStart,
                height: 48,
                padding: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end: BorderSide(color: bordergrey, width: 1))),
                child: Text('Full Name', style: CustomTextStyle.title(ctxt)),
              ),
              Container(
                width:
                    width >= 768 && width <= 1023 ? width * 0.22 : width * 0.25,
                alignment: AlignmentDirectional.centerStart,
                height: 48,
                padding: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end: BorderSide(color: bordergrey, width: 1))),
                child: Text('Email ID', style: CustomTextStyle.title(ctxt)),
              ),
              Container(
                width:
                    width >= 768 && width <= 1023 ? width * 0.13 : width * 0.15,
                alignment: AlignmentDirectional.center,
                height: 48,
                padding: EdgeInsets.only(),
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end: BorderSide(color: bordergrey, width: 1))),
                child:
                    Text('Date of Birth', style: CustomTextStyle.title(ctxt)),
              ),
              MediaQuery.of(context).size.width >= 1024
                  ? Container(
                      width: width * 0.13,
                      alignment: AlignmentDirectional.center,
                      height: 48,
                      padding: EdgeInsets.only(),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: bordergrey, width: 1))),
                      child: Text('Spouse Name',
                          style: CustomTextStyle.title(ctxt)),
                    )
                  : Container(height: 0, width: 0),
              Container(
                width:
                    width >= 768 && width <= 1023 ? width * 0.13 : width * 0.15,
                alignment: AlignmentDirectional.center,
                height: 48,
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end: BorderSide(color: bordergrey, width: 1))),
                child: Text('Spouse DOB', style: CustomTextStyle.title(ctxt)),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                height: 48,
                width:
                    width >= 768 && width <= 1023 ? width * 0.11 : width * 0.13,
                padding: EdgeInsets.only(),
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end: BorderSide(color: Colors.white, width: 0))),
                child: Text('Actions', style: CustomTextStyle.title(ctxt)),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
