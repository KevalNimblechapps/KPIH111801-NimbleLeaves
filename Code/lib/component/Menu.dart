import 'package:flutter/material.dart';
import 'package:nimble_leaves/Dashboard/Dashboard.dart';
import 'package:nimble_leaves/PlannedLeave/PlannedLeave.dart';
import 'package:nimble_leaves/Report/Report.dart';
import 'package:nimble_leaves/UnplannedLeave/UnplannedLeave.dart';
import 'package:nimble_leaves/component/Colors.dart';

import 'package:nimble_leaves/employee/ListEmployee.dart';
import 'package:nimble_leaves/main.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';

class DrawerOnly extends StatefulWidget {
  DrawerOnly(
      {Key key,
      this.dashboard = false,
      this.unplanned = false,
      this.report = false,
      this.planned = false,
      this.employee = false})
      : super(key: key);
  final bool dashboard;
  final bool unplanned;
  final bool report;
  final bool planned;
  final bool employee;
  @override
  State<StatefulWidget> createState() => DrawerOnlyState();
  // @override
  // DrawerOnlyState createState() {
  //   return new DrawerOnlyState();
  // }
}

class DrawerOnlyState extends State<DrawerOnly> {
  @override
  Widget build(BuildContext ctxt) {
    double width = MediaQuery.of(ctxt).size.width;
    if (width <= 767) {
      return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(ctxt).padding.top),
        child: Container(
          width: 65.0,
          decoration: new BoxDecoration(boxShadow: [
            new BoxShadow(
              color: Colors.grey[400],
              blurRadius: 10.0,
            ),
          ]),

          // height: MediaQuery.of(ctxt).size.height * 0.97,
          child: new LayoutBuilder(
            builder: (context, constraints) => Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Drawer(
                        elevation: 0,
                        child: new ListView(
                          padding: EdgeInsets.zero,
                          children: <Widget>[
                            new Container(
                              height: 65,
                              child: new DrawerHeader(
                                padding: EdgeInsets.all(0),
                                margin: EdgeInsets.all(0),
                                child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(
                                      Icons.close,
                                      color: CustomColors.inactive,
                                    ),
                                    iconSize: 38,
                                    onPressed: () {
                                      Navigator.of(ctxt).pop();
                                    }),
                              ),
                            ),
                            // new ListTile(
                            //   title: IconButton(
                            //       alignment: Alignment.centerLeft,
                            //       padding:
                            //           EdgeInsets.only(right: 12.0, left: 1.0),
                            //       icon: Icon(
                            //         Icons.close,
                            //         color: inactive,
                            //       ),
                            //       iconSize: 38,
                            //       onPressed: () {
                            //         Navigator.of(ctxt).pop();
                            //       }),
                            // ),
                            new Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: new Divider(
                                  color: Color.fromRGBO(237, 237, 237, 1)),
                            ),
                            new ListTile(
                              title: IconButton(
                                  icon: Icon(
                                    widget.dashboard
                                        ? CustomIcons.dashboardactive
                                        : CustomIcons.dashboard,
                                    color: widget.dashboard
                                        ? CustomColors.active
                                        : CustomColors.inactive,
                                  ),
                                  iconSize: 36,
                                  onPressed: null,
                                  padding:
                                      EdgeInsets.only(right: 12.0, left: 1.0)),
                              onTap: () {
                                Navigator.pop(ctxt);
                                Navigator.push(
                                    ctxt,
                                    new MaterialPageRoute(
                                        builder: (ctxt) => new Dashboard()));
                              },
                            ),
                            new Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: new Divider(
                                color: Color.fromRGBO(237, 237, 237, 1),
                              ),
                            ),
                            new ListTile(
                              title: IconButton(
                                  icon: Icon(
                                    widget.unplanned
                                        ? CustomIcons.unplannedactive
                                        : CustomIcons.unplanned,
                                    color: widget.unplanned
                                        ? CustomColors.active
                                        : CustomColors.inactive,
                                  ),
                                  iconSize: 36,
                                  onPressed: null,
                                  padding:
                                      EdgeInsets.only(right: 12.0, left: 1.0)),
                              onTap: () {
                                Navigator.pop(ctxt);
                                Navigator.push(
                                    ctxt,
                                    new MaterialPageRoute(
                                        builder: (ctxt) =>
                                            new UnplannedLeave()));
                              },
                            ),
                            new Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: new Divider(
                                color: Color.fromRGBO(237, 237, 237, 1),
                              ),
                            ),
                            new ListTile(
                              title: IconButton(
                                  icon: Icon(
                                    widget.report
                                        ? CustomIcons.reports
                                        : CustomIcons.reports,
                                    color: widget.report
                                        ? CustomColors.active
                                        : CustomColors.inactive,
                                  ),
                                  iconSize: 36,
                                  onPressed: null,
                                  padding:
                                      EdgeInsets.only(right: 12.0, left: 1.0)),
                              onTap: () {
                                Navigator.pop(ctxt);
                                Navigator.push(
                                    ctxt,
                                    new MaterialPageRoute(
                                        builder: (ctxt) => new Report()));
                              },
                            ),
                            new Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: new Divider(
                                color: Color.fromRGBO(237, 237, 237, 1),
                              ),
                            ),
                            new ListTile(
                              title: IconButton(
                                  icon: Icon(
                                    widget.planned == true
                                        ? CustomIcons.plannedactive
                                        : CustomIcons.planned,
                                    color: widget.planned == true
                                        ? CustomColors.active
                                        : CustomColors.inactive,
                                  ),
                                  iconSize: 36,
                                  onPressed: null,
                                  padding:
                                      EdgeInsets.only(right: 12.0, left: 1.0)),
                              onTap: () {
                                Navigator.pop(ctxt);
                                Navigator.push(
                                    ctxt,
                                    new MaterialPageRoute(
                                        builder: (ctxt) => new PlannedLeave()));
                              },
                            ),
                            new Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: new Divider(
                                color: Color.fromRGBO(237, 237, 237, 1),
                              ),
                            ),
                            new ListTile(
                              title: IconButton(
                                  icon: Icon(
                                    widget.employee
                                        ? CustomIcons.employee
                                        : CustomIcons.employee_inactive,
                                    color: widget.employee
                                        ? CustomColors.active
                                        : CustomColors.inactive,
                                  ),
                                  iconSize: 36,
                                  onPressed: null,
                                  padding: EdgeInsets.only(
                                    right: 12.0,
                                    left: 1.0,
                                  )),
                              onTap: () {
                                Navigator.pop(ctxt);
                                Navigator.push(
                                    ctxt,
                                    new MaterialPageRoute(
                                        builder: (ctxt) => new SecondScreen()));
                              },
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: 75,
                        right: 12,
                        child: Container(
                          width: 42,
                          height: 1,
                          child: new Divider(
                            color: Color.fromRGBO(237, 237, 237, 1),
                          ),
                        )),
                    Positioned(
                      bottom: 15,
                      right: 8,
                      child: IconButton(
                          icon: Icon(
                            CustomIcons.logout,
                            color: CustomColors.inactive,
                          ),
                          iconSize: 42,
                          onPressed: () {
                            Navigator.pop(ctxt);
                            Navigator.pop(
                                ctxt,
                                new MaterialPageRoute(
                                    builder: (ctxt) => new FirstScreen()));
                          },
                          padding: EdgeInsets.only()),
                    ),
                  ],
                ),
          ),
        ),
      );
    } else if (width >= 767 && width <= 1023) {
      return ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(width: MediaQuery.of(ctxt).size.width * 0.33),
          Container(
            width: 60.0,
            child: IconButton(
                icon: Icon(
                  widget.dashboard
                      ? CustomIcons.dashboardactive
                      : CustomIcons.dashboard,
                  color: widget.dashboard
                      ? CustomColors.active
                      : CustomColors.inactive,
                ),
                iconSize: 28,
                onPressed: () {
                  Navigator.pop(ctxt);
                  Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new Dashboard()));
                },
                padding: EdgeInsets.only(top: 10)),
          ),
          Container(
            width: 60.0,
            child: IconButton(
                icon: Icon(
                  widget.unplanned
                      ? CustomIcons.unplannedactive
                      : CustomIcons.unplanned,
                  color: widget.unplanned
                      ? CustomColors.active
                      : CustomColors.inactive,
                ),
                iconSize: 28,
                onPressed: () {
                  Navigator.pop(ctxt);
                  Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new UnplannedLeave()));
                },
                padding: EdgeInsets.only(top: 10)),
          ),
          Container(
            width: 60.0,
            child: IconButton(
                icon: Icon(
                  widget.report ? CustomIcons.reports : CustomIcons.reports,
                  color: widget.report
                      ? CustomColors.active
                      : CustomColors.inactive,
                ),
                iconSize: 28,
                onPressed: () {
                  Navigator.pop(ctxt);
                  Navigator.push(ctxt,
                      new MaterialPageRoute(builder: (ctxt) => new Report()));
                },
                padding: EdgeInsets.only(top: 10)),
          ),
          Container(
            width: 60.0,
            child: IconButton(
                icon: Icon(
                  widget.planned
                      ? CustomIcons.plannedactive
                      : CustomIcons.planned,
                  color: widget.planned
                      ? CustomColors.active
                      : CustomColors.inactive,
                ),
                iconSize: 28,
                onPressed: () {
                  Navigator.pop(ctxt);
                  Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new PlannedLeave()));
                },
                padding: EdgeInsets.only(top: 10)),
          ),
          Container(
            width: 60.0,
            child: IconButton(
                icon: Icon(
                  widget.employee
                      ? CustomIcons.employee
                      : CustomIcons.employee_inactive,
                  color: widget.employee
                      ? CustomColors.active
                      : CustomColors.inactive,
                ),
                iconSize: 28,
                onPressed: () {
                  Navigator.pop(ctxt);
                  Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new SecondScreen()));
                },
                padding: EdgeInsets.only(top: 10)),
          ),
          Container(
            width: 60.0,
            child: IconButton(
                icon: Icon(
                  CustomIcons.logout,
                  color: CustomColors.inactive,
                ),
                iconSize: 32,
                onPressed: () {
                  Navigator.pop(ctxt);
                  Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new FirstScreen()));
                },
                padding: EdgeInsets.only(top: 10)),
          ),
        ],
      );
    } else {
      return ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(width: MediaQuery.of(ctxt).size.width * 0.47),
          Container(
              padding: EdgeInsets.zero,
              width: widget.dashboard ? 67.0 : 60.0,
              child: widget.dashboard
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => {},
                          padding: EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            textDirection: TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              Icon(
                                CustomIcons.dashboardactive,
                                color: CustomColors.active,
                                textDirection: TextDirection.ltr,
                                size: 18,
                              ),
                              Text(
                                "Dashboard",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: CustomColors.active,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : IconButton(
                      icon: Icon(
                        CustomIcons.dashboard,
                        color: CustomColors.inactive,
                      ),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.pop(ctxt);
                        Navigator.push(
                            ctxt,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Dashboard()));
                      },
                      padding: EdgeInsets.only(top: 10))),
          Container(
              padding: EdgeInsets.zero,
              width: widget.unplanned ? 70.0 : 60.0,
              child: widget.unplanned
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => {},
                          padding: EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            textDirection: TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              Icon(
                                CustomIcons.unplannedactive,
                                color: CustomColors.active,
                                textDirection: TextDirection.ltr,
                                size: 18,
                              ),
                              Text(
                                "Unplanned",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: CustomColors.active,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : IconButton(
                      icon: Icon(
                        CustomIcons.unplanned,
                        color: CustomColors.inactive,
                      ),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.pop(ctxt);
                        Navigator.push(
                            ctxt,
                            new MaterialPageRoute(
                                builder: (ctxt) => new UnplannedLeave()));
                      },
                      padding: EdgeInsets.only(top: 10))),
          Container(
              width: widget.report ? 60.0 : 60.0,
              child: widget.report
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(ctxt);
                            Navigator.push(
                                ctxt,
                                new MaterialPageRoute(
                                    builder: (ctxt) => new Report()));
                          },
                          padding: EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            textDirection: TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              Icon(
                                CustomIcons.reports,
                                color: CustomColors.active,
                                textDirection: TextDirection.ltr,
                                size: 18,
                              ),
                              Text(
                                "Report",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: CustomColors.active,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : IconButton(
                      icon: Icon(
                        CustomIcons.reports,
                        color: CustomColors.inactive,
                      ),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.pop(ctxt);
                        Navigator.push(
                            ctxt,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Report()));
                      },
                      padding: EdgeInsets.only(top: 10))),
          Container(
              width: widget.planned ? 80.0 : 60.0,
              child: widget.planned
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(ctxt);
                            Navigator.push(
                                ctxt,
                                new MaterialPageRoute(
                                    builder: (ctxt) => new PlannedLeave()));
                          },
                          padding: EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            textDirection: TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              Icon(
                                CustomIcons.plannedactive,
                                color: CustomColors.active,
                                textDirection: TextDirection.ltr,
                                size: 18,
                              ),
                              Text(
                                "Planned",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: CustomColors.active,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : IconButton(
                      icon: Icon(
                        CustomIcons.planned,
                        color: CustomColors.inactive,
                      ),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.pop(ctxt);
                        Navigator.push(
                            ctxt,
                            new MaterialPageRoute(
                                builder: (ctxt) => new PlannedLeave()));
                      },
                      padding: EdgeInsets.only(top: 10))),
          Container(
              width: widget.employee ? 80.0 : 60.0,
              child: widget.employee
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(ctxt);
                            Navigator.push(
                                ctxt,
                                new MaterialPageRoute(
                                    builder: (ctxt) => new SecondScreen()));
                          },
                          padding: EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            textDirection: TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              Icon(
                                CustomIcons.employee,
                                color: CustomColors.active,
                                textDirection: TextDirection.ltr,
                                size: 18,
                              ),
                              Text(
                                "Employee",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: CustomColors.active,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : IconButton(
                      icon: Icon(
                        CustomIcons.employee_inactive,
                        color: CustomColors.inactive,
                      ),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.pop(ctxt);
                        Navigator.push(
                            ctxt,
                            new MaterialPageRoute(
                                builder: (ctxt) => new SecondScreen()));
                      },
                      padding: EdgeInsets.only(top: 10))),
          Container(
            width: 60.0,
            child: IconButton(
                icon: Icon(
                  CustomIcons.logout,
                  color: CustomColors.inactive,
                ),
                iconSize: 28,
                onPressed: () {
                  Navigator.pop(ctxt);
                  Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new FirstScreen()));
                },
                padding: EdgeInsets.only(top: 10)),
          ),
        ],
      );
    }
  }
}
