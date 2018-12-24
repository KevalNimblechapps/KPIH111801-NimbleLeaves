import 'package:flutter/material.dart';
import 'package:nimble_leaves/employee_list/employee_list.dart';
import 'package:nimble_leaves/main.dart';
import 'package:nimble_leaves/custom_icons_icons.dart';

const kShrineBrown900 = const Color.fromRGBO(78, 125, 254, 1);

class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    double width = MediaQuery.of(ctxt).size.width;
    return SizedBox(
        width: 72.0,
        child: new Drawer(
            child: new ListView(
          children: <Widget>[
            // new DrawerHeader(
            //   child: IconButton(
            //     icon: Icon(Icons.close),
            //     color: Colors.blueGrey,
            //   ),
            //   decoration: new BoxDecoration(color: Colors.white),
            // ),
            Container(
              height: 30.0,
              child: DrawerHeader(
                child: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.blueGrey,
                    onPressed: null),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
              ),
            ),
            new Divider(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),
            new ListTile(
              title: IconButton(
                  icon: Icon(CustomIcons.dashboard),
                  iconSize: 36,
                  color: Colors.blueGrey,
                  onPressed: null,
                  padding: EdgeInsets.only(right: 12.0, left: 1.0)),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(
                    ctxt,
                    new MaterialPageRoute(
                        builder: (ctxt) => new FirstScreen()));
              },
            ),
            new Divider(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),
            new ListTile(
              title: IconButton(
                  icon: Icon(CustomIcons.unplanned),
                  iconSize: 36,
                  color: Colors.blueGrey,
                  onPressed: null,
                  padding: EdgeInsets.only(right: 12.0, left: 1.0)),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(
                    ctxt,
                    new MaterialPageRoute(
                        builder: (ctxt) => new SecondScreen()));
              },
            ),
            new Divider(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),
            new ListTile(
              title: IconButton(
                  icon: Icon(CustomIcons.reports),
                  iconSize: 36,
                  color: Colors.blueGrey,
                  onPressed: null,
                  padding: EdgeInsets.only(right: 12.0, left: 1.0)),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(
                    ctxt,
                    new MaterialPageRoute(
                        builder: (ctxt) => new SecondScreen()));
              },
            ),
            new Divider(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),
            new ListTile(
              title: IconButton(
                  icon: Icon(CustomIcons.planned),
                  iconSize: 36,
                  color: Colors.blueGrey,
                  onPressed: null,
                  padding: EdgeInsets.only(right: 12.0, left: 1.0)),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(
                    ctxt,
                    new MaterialPageRoute(
                        builder: (ctxt) => new SecondScreen()));
              },
            ),
            new Divider(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),
            new ListTile(
              selected: true,
              title: IconButton(
                  icon: Icon(
                    CustomIcons.employee,
                    color: kShrineBrown900,
                  ),
                  iconSize: 36,
                  onPressed: null,
                  padding: EdgeInsets.only(right: 12.0, left: 1.0)),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(
                    ctxt,
                    new MaterialPageRoute(
                        builder: (ctxt) => new SecondScreen()));
              },
            ),
            new Divider(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),
            new ListTile(
              title: IconButton(
                  icon: Icon(CustomIcons.logout),
                  iconSize: 36,
                  color: Colors.blueGrey,
                  onPressed: null,
                  padding: EdgeInsets.only(right: 12.0, left: 1.0)),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(
                    ctxt,
                    new MaterialPageRoute(
                        builder: (ctxt) => new FirstScreen()));
              },
            ),
          ],
        )));
  }
}
