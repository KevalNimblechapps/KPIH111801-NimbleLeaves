import 'package:flutter/material.dart';
import 'package:nimble_leaves/employee_list/employee_list.dart';
import 'package:nimble_leaves/main.dart';
import 'package:nimble_leaves/custom_icons_icons.dart';

class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Drawer(
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
              decoration: BoxDecoration(color: Colors.white),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0)),
        ),
        new Divider(
          color: Color.fromRGBO(237, 237, 237, 1),
        ),
        new ListTile(
          title: IconButton(
              icon: Icon(CustomIcons.dashboard),
              color: Colors.blueGrey,
              onPressed: null),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new FirstScreen()));
          },
        ),
        new Divider(
          color: Color.fromRGBO(237, 237, 237, 1),
        ),
        new ListTile(
          title: IconButton(
              icon: Icon(CustomIcons.unplanned),
              color: Colors.blueGrey,
              onPressed: null),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new SecondScreen()));
          },
        ),
        new Divider(
          color: Color.fromRGBO(237, 237, 237, 1),
        ),
        new ListTile(
          title: IconButton(
              icon: Icon(CustomIcons.reports),
              color: Colors.blueGrey,
              onPressed: null),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new SecondScreen()));
          },
        ),
        new Divider(
          color: Color.fromRGBO(237, 237, 237, 1),
        ),
        new ListTile(
          title: IconButton(
              icon: Icon(CustomIcons.planned),
              color: Colors.blueGrey,
              onPressed: null),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new SecondScreen()));
          },
        ),
        new Divider(
          color: Color.fromRGBO(237, 237, 237, 1),
        ),
        new ListTile(
          title: IconButton(
              icon: Icon(CustomIcons.employee),
              color: Colors.blueGrey,
              onPressed: null),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new SecondScreen()));
          },
        ),
        new Divider(
          color: Color.fromRGBO(237, 237, 237, 1),
        ),
        new ListTile(
          title: IconButton(
              icon: Icon(CustomIcons.logout),
              color: Colors.blueGrey,
              onPressed: null),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new SecondScreen()));
          },
        ),
      ],
    ));
  }
}
