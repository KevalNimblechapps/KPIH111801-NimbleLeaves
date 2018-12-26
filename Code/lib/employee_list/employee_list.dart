import 'package:flutter/material.dart';
import 'package:nimble_leaves/custom_icons_icons.dart';
import 'package:nimble_leaves/menu/menu.dart';
import 'package:material_search/material_search.dart';

const active = const Color.fromRGBO(78, 125, 254, 1);
const greydark = const Color.fromRGBO(119, 140, 161, 1);

class SecondScreen extends StatelessWidget {
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
  String _name = 'No one';
  final _formKey = new GlobalKey<FormState>();
  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: true,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Search',
              results: _names
                  .map((String v) => new MaterialSearchResult<String>(
                        value: v,
                        text: "Mr(s). $v",
                      ))
                  .toList(),
              filter: (dynamic value, String criteria) {
                return value.toLowerCase().trim().contains(
                    new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) => Navigator.of(context).pop(value),
              onSubmit: (String value) => Navigator.of(context).pop(value),
            ),
          );
        });
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      // setState(() => _name = value as String);
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      endDrawer: new DrawerOnly(),
      key: _scaffoldKey,
      appBar: new AppBar(
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
          leading: new Container(
            child: Image.asset('images/logo.png'),
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
                    padding: EdgeInsets.only(right: 28),
                  )
                ]),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              child: new Form(
                key: _formKey,
                child: Row(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Icon(
                              Icons.search,
                              color: greydark,
                            ),
                            new SizedBox(
                              width: MediaQuery.of(context).size.width * 0.67,
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
                                  return value.toLowerCase().trim().contains(
                                      new RegExp(r'' +
                                          criteria.toLowerCase().trim() +
                                          ''));
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
                        child: new IconButton(
                          icon: Icon(
                            CustomIcons.filter,
                            color: greydark,
                          ),
                          onPressed: null,
                        ))
                  ],
                ),
              ),
            ),
            new Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 00.0, horizontal: 00.0),
                child: new Column(children: <Widget>[
                  new Text(
                    'OOPS!',
                    style: TextStyle(
                        color: greydark,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'SairaSemiCondensed'),
                  ),
                  Text('Nothing found here.',
                      style: TextStyle(
                          color: greydark,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          height: 0.8,
                          fontFamily: 'SairaSemiCondensed'))
                ])),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              child: new SimpleDialog(
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Add Employee",
                      style: TextStyle(
                          color: greydark,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 0.8,
                          fontFamily: 'SairaSemiCondensed'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Icon(Icons.close, size: 24, color: greydark),
                    ),
                  ],
                ),
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Treasury department'),
                  ),
                ],
              ));
        },
        tooltip: 'Add',
        child: new Icon(Icons.add),
        backgroundColor: active,
      ),
    );
  }
}
