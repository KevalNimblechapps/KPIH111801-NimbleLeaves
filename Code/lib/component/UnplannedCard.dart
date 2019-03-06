import 'package:flutter/material.dart';
import 'package:nimble_leaves/UnplannedLeave/AddUnplannedLeave.dart';
import 'package:nimble_leaves/component/Capsule.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';

class CustomTextStyle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(
        fontSize: 16.0,
        height: 0.8,
        color: CustomColors.inactive,
        fontWeight: FontWeight.w300);
  }

  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.display3.copyWith(
        fontSize: 15.0,
        color: CustomColors.active,
        fontWeight: FontWeight.w600);
  }

  static TextStyle list(BuildContext context) {
    return Theme.of(context).textTheme.display3.copyWith(
        fontSize: 14.0,
        color: CustomColors.inactive,
        fontWeight: FontWeight.w500);
  }
}

class UnplannedCard extends StatefulWidget {
  UnplannedCard({this.name, this.type, this.reason, this.onDelete});
  final String name;
  final String type;
  final String reason;
  final VoidCallback onDelete;
  @override
  UnplannedCardState createState() {
    return new UnplannedCardState();
  }
}

class UnplannedCardState extends State<UnplannedCard> {
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
          border: new Border.all(color: CustomColors.bordergrey, width: 1),
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
                                widget.name,
                                style: CustomTextStyle.display5(ctxt),
                              ),
                              margin: EdgeInsets.only(bottom: 2.0),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Capsule(
                                type: widget.type,
                              ),
                              margin: EdgeInsets.only(bottom: 5.0),
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
                                          size: 18.0,
                                          color: CustomColors.inactive),
                                      onPressed: () {
                                        showDialog(
                                            context: ctxt,
                                            child: new AddUnplannedLeave(
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
                                        size: 18.0,
                                        color: CustomColors.inactive),
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
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: width - 32,
                          padding: EdgeInsets.zero,
                          child: Text(widget.reason,
                              textAlign: TextAlign.left,
                              style: CustomTextStyle.display5(ctxt)),
                          margin: EdgeInsets.only(bottom: 5.0),
                        ),
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
                      width: width >= 768 && width <= 1023
                          ? width * 0.15
                          : width * 0.2,
                      alignment: AlignmentDirectional.centerStart,
                      padding: EdgeInsets.only(right: 15, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.white, width: 0))),
                      child:
                          Text(widget.name, style: CustomTextStyle.list(ctxt)),
                    ),
                    Container(
                        width: width >= 768 && width <= 1023
                            ? width * 0.15
                            : width * 0.2,
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 15),
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end:
                                    BorderSide(color: Colors.white, width: 0))),
                        child: Row(
                          children: <Widget>[
                            Capsule(
                              type: 'sick',
                            ),
                            Capsule(
                              type: 'emergency',
                            ),
                          ],
                        )),
                    Container(
                      width: width >= 768 && width <= 1023
                          ? width * 0.43
                          : width * 0.27,
                      alignment: AlignmentDirectional.centerStart,
                      padding: EdgeInsets.only(
                          right: 15,
                          top: 15,
                          bottom: 15,
                          left: width >= 768 && width <= 1023 ? 15 : 0),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.white, width: 0))),
                      child: Text(widget.reason,
                          style: CustomTextStyle.list(ctxt)),
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      width: width >= 768 && width <= 1023
                          ? width * 0.13
                          : width * 0.15,
                      padding: EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(color: Colors.white, width: 0))),
                      child: Capsule(
                        type: 'planned',
                      ),
                    ),
                    Container(
                        alignment: AlignmentDirectional.center,
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
                            // Text('jfnjkdfk'),F
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
                                          size: 18.0,
                                          color: CustomColors.inactive),
                                      onPressed: () {
                                        showDialog(
                                            context: ctxt,
                                            child: new AddUnplannedLeave(
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
                                        size: 18.0,
                                        color: CustomColors.inactive),
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

class UnplannedHeading extends StatefulWidget {
  @override
  HeadingState createState() {
    return new HeadingState();
  }
}

class HeadingState extends State<UnplannedHeading> {
  bool isEdit = false;

  @override
  Widget build(BuildContext ctxt) {
    double width = MediaQuery.of(ctxt).size.width - 30;
    return new Container(
      width: MediaQuery.of(ctxt).size.width - 30,
      margin: EdgeInsets.only(bottom: 11),
      // margin: EdgeInsets.only(bottom: 0),
      padding: MediaQuery.of(context).size.width <= 767
          ? EdgeInsets.all(15)
          : EdgeInsets.only(left: 15, right: 0, bottom: 0),
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
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: width >= 768 && width <= 1023
                      ? width * 0.15
                      : width * 0.2,
                  padding: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          end: BorderSide(
                              color: CustomColors.bordergrey, width: 1))),
                  child: MaterialButton(
                    height: 10,
                    minWidth: 50,
                    padding: EdgeInsets.all(0),
                    highlightColor: Colors.transparent,
                    onPressed: null,
                    child: Row(
                      children: <Widget>[
                        Text('Employee Name',
                            style: CustomTextStyle.title(ctxt)),
                        Padding(padding: EdgeInsets.only(left: 7)),
                        Icon(CustomIcons.sorting,
                            size: 15, color: CustomColors.active)
                      ],
                    ),
                  )),
              Container(
                width:
                    width >= 768 && width <= 1023 ? width * 0.15 : width * 0.18,
                alignment: AlignmentDirectional.center,
                height: 48,
                padding: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end: BorderSide(
                            color: CustomColors.bordergrey, width: 1))),
                child:
                    Text('Sick/Emergency', style: CustomTextStyle.title(ctxt)),
              ),
              Container(
                width:
                    width >= 768 && width <= 1023 ? width * 0.43 : width * 0.31,
                alignment: AlignmentDirectional.centerStart,
                height: 48,
                padding: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end: BorderSide(
                            color: CustomColors.bordergrey, width: 1))),
                child: Text('Reason', style: CustomTextStyle.title(ctxt)),
              ),
              Container(
                width:
                    width >= 768 && width <= 1023 ? width * 0.13 : width * 0.15,
                alignment: AlignmentDirectional.center,
                height: 48,
                padding: EdgeInsets.only(),
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end: BorderSide(
                            color: CustomColors.bordergrey, width: 1))),
                child: Text('Late/Early', style: CustomTextStyle.title(ctxt)),
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
