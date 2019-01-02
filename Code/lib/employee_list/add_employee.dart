import 'package:flutter/material.dart';
import 'package:nimble_leaves/custom_icons_icons.dart';
import 'package:intl/intl.dart';

const active = const Color.fromRGBO(78, 125, 254, 1);
const greydark = const Color.fromRGBO(119, 140, 161, 1);
const greylight = const Color.fromRGBO(193, 193, 193, 1);
const greymedium = const Color.fromRGBO(216, 216, 216, 1);
const pink = const Color.fromRGBO(252, 77, 149, 1);

class AddEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddEmployeeState();
}

enum FormType { addEmployee }

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController _controller;
  var txt = new TextEditingController();
  var txt1 = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _code = "005";
  String _codeerror = "";
  String _name = "";
  String _nameerror = "";
  String _email = "";
  String _emailerror = "";
  String _sname = "";
  String _snameerror = "";
  String _svalue = "";
  String _svalueerror = "";
  String _value = '';
  String _valuedob = '';
  String _valuedoberror = '';
  FormType _formType = FormType.addEmployee;
  DateTime date;
  final dateFormat = DateFormat("MMMM d, yyyy");

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: '005');
  }

  Widget build(BuildContext context) {
    return new SimpleDialog(
        contentPadding: EdgeInsets.all(0.0),
        titlePadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3))),
        title: new Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey[200],
                  offset: Offset(0.0, 2.0),
                  blurRadius: 8.0,
                ),
              ],
              borderRadius: BorderRadius.circular(3)),
          child: new Row(
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
              new SizedBox(
                  width: 30,
                  child: RaisedButton(
                    child: new Icon(
                      Icons.close,
                      size: 28,
                      color: greydark,
                    ),
                    highlightColor: Colors.transparent,
                    elevation: 0,
                    highlightElevation: 0,
                    splashColor: Colors.transparent,
                    color: Colors.transparent,
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ))
            ],
          ),
        ),
        children: <Widget>[
          new Container(
              padding:
                  new EdgeInsets.only(top: 5.0, left: 0, right: 0, bottom: 10),
              // child: new Form(
              //   key: _formKey,
              // autovalidate: _autoValidate,
              child: new Column(
                children: <Widget>[
                  new Container(
                      constraints: new BoxConstraints.expand(
                        height: 60.0,
                      ),
                      child: new Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          new TextField(
                            keyboardType: TextInputType.number,
                            controller: _controller,
                            enabled: false, // Use email input type for emails.
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10, left: 15, right: 15),
                                hintText: '005',
                                labelText: 'Code',
                                suffix: new Icon(
                                  Icons.block,
                                  size: 16,
                                  color: greylight,
                                ),
                                labelStyle: new TextStyle(
                                    color: greylight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'SairaSemiCondensed'),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: greymedium, width: 0.8)),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: greymedium, width: 0.8)),
                                hintStyle: TextStyle(color: Colors.grey)),

                            onChanged: (value) => setState(() {
                                  _code = value;
                                  _codeerror = validateCode(value);
                                }),
                          ),
                          new Positioned(
                            left: 15.0,
                            bottom: 0.0,
                            child: _codeerror != ""
                                ? new Container(
                                    padding: EdgeInsets.only(
                                        left: 5, right: 5, top: 1, bottom: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(5.0),
                                            bottomRight:
                                                const Radius.circular(5.0)),
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.grey[300],
                                            blurRadius: 5.0,
                                          ),
                                        ]),
                                    child: Text(
                                      _codeerror,
                                      style: TextStyle(
                                        color: pink,
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ))
                                : new Text(''),
                          ),
                        ],
                      )),
                  new Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(0),
                      constraints: new BoxConstraints.expand(
                        height: 50.0,
                      ),
                      child: new Stack(
                        overflow: Overflow.visible,
                        fit: StackFit.loose,
                        children: <Widget>[
                          new TextField(
                            keyboardType: TextInputType
                                .text, // Use email input type for emails.
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 0, left: 15, right: 15),
                              hintText: '',
                              labelText: 'Full Name',
                              labelStyle: new TextStyle(
                                  color: greylight,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SairaSemiCondensed'),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: greymedium, width: 0.8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                            ),

                            // validator: validateName,
                            // onSaved: (String val) {
                            //   _name = val;
                            // },
                            onChanged: (value) => setState(() {
                                  _name = value;
                                  _nameerror = validateName(value);
                                }),
                          ),
                          new Positioned(
                              left: 15.0,
                              bottom: -13.0,
                              child: _nameerror != ""
                                  ? new Container(
                                      padding: EdgeInsets.only(
                                          left: 9, right: 9, top: 1, bottom: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  const Radius.circular(5.0),
                                              bottomRight:
                                                  const Radius.circular(5.0)),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.grey[300],
                                              blurRadius: 5.0,
                                            ),
                                          ]),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            CustomIcons.warning,
                                            size: 11,
                                            color: pink,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8)),
                                          Text(_nameerror,
                                              style: TextStyle(
                                                  color: pink, fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1),
                                        ],
                                      ))
                                  : new Text('')),
                        ],
                      )),
                  new Container(
                      padding: EdgeInsets.all(0),
                      constraints: new BoxConstraints.expand(
                        height: 50.0,
                      ),
                      child: new Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          new TextField(
                            keyboardType: TextInputType
                                .emailAddress, // Use email input type for emails.
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 0, left: 15, right: 15),
                              hintText: '',
                              labelText: 'Email ID',
                              labelStyle: new TextStyle(
                                  color: greylight,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SairaSemiCondensed'),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: greymedium, width: 0.8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                            ),

                            onChanged: (value) => setState(() {
                                  _email = value;
                                  _emailerror = validateEmail(value);
                                }),
                          ),
                          new Positioned(
                              left: 15.0,
                              bottom: -13.0,
                              child: _emailerror != ""
                                  ? new Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 1,
                                          bottom: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  const Radius.circular(5.0),
                                              bottomRight:
                                                  const Radius.circular(5.0)),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.grey[300],
                                              blurRadius: 5.0,
                                            ),
                                          ]),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          CustomIcons.warning,
                                          size: 11,
                                          color: pink,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 8)),
                                        Text(_emailerror,
                                            style: TextStyle(
                                                color: pink, fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1)
                                      ]))
                                  : new Text('')),
                        ],
                      )),
                  new Container(
                      padding: EdgeInsets.all(0),
                      constraints: new BoxConstraints.expand(
                        height: 50.0,
                      ),
                      child: new Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          new TextField(
                            controller: txt,
                            // Use email input type for emails.
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 0, left: 15, right: 15),
                              hintText: '',
                              labelText: 'Date of Birth',
                              labelStyle: new TextStyle(
                                  color: greylight,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'SairaSemiCondensed'),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: greymedium, width: 0.8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                            ),

                            onTap: _selectDate,
                          ),
                          new Positioned(
                              left: 15.0,
                              bottom: -13.0,
                              child: _valuedoberror != ""
                                  ? new Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 1,
                                          bottom: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  const Radius.circular(5.0),
                                              bottomRight:
                                                  const Radius.circular(5.0)),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.grey[300],
                                              blurRadius: 5.0,
                                            ),
                                          ]),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          CustomIcons.warning,
                                          size: 11,
                                          color: pink,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 8)),
                                        Text(_valuedoberror,
                                            style: TextStyle(
                                                color: pink, fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1)
                                      ]))
                                  : new Text('')),
                        ],
                      )),
                  new Container(
                      padding: EdgeInsets.all(0),
                      constraints: new BoxConstraints.expand(
                        height: 50.0,
                      ),
                      child: new Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          new TextField(
                            keyboardType: TextInputType
                                .emailAddress, // Use email input type for emails.
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 0, left: 15, right: 15),
                              hintText: '',
                              labelText: 'Spouse Name',
                              labelStyle: new TextStyle(
                                  color: greylight,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'SairaSemiCondensed'),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: greymedium, width: 0.8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                            ),
                            onChanged: (value) => setState(() {
                                  _sname = value;
                                  _snameerror = validateSpouseName(value);
                                }),
                          ),
                          new Positioned(
                              left: 15.0,
                              bottom: -13.0,
                              child: _snameerror != ""
                                  ? new Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 1,
                                          bottom: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  const Radius.circular(5.0),
                                              bottomRight:
                                                  const Radius.circular(5.0)),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.grey[300],
                                              blurRadius: 5.0,
                                            ),
                                          ]),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          CustomIcons.warning,
                                          size: 11,
                                          color: pink,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 8)),
                                        Text(_snameerror,
                                            style: TextStyle(
                                                color: pink, fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1)
                                      ]))
                                  : new Text('')),
                        ],
                      )),
                  new Container(
                      padding: EdgeInsets.all(0),
                      constraints: new BoxConstraints.expand(
                        height: 50.0,
                      ),
                      child: new Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          new TextField(
                            controller: txt1,
                            // Use email input type for emails.
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 0, left: 15, right: 15),
                              hintText: '',
                              labelText: 'Spouse DOB',
                              labelStyle: new TextStyle(
                                  color: greylight,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'SairaSemiCondensed'),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: greymedium, width: 0.8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: greymedium, width: 0.8)),
                            ),

                            // onChanged: (txt1) => setState(() {
                            //       _valuedob = txt1;
                            //       _svalueerror = validateSpouseDOB(txt1);
                            //     }),

                            onTap: _selectSpouseDate,
                          ),
                          new Positioned(
                              left: 15.0,
                              bottom: -13.0,
                              child: _svalueerror != ""
                                  ? new Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 1,
                                          bottom: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  const Radius.circular(5.0),
                                              bottomRight:
                                                  const Radius.circular(5.0)),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.grey[300],
                                              blurRadius: 5.0,
                                            ),
                                          ]),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          CustomIcons.warning,
                                          size: 11,
                                          color: pink,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 8)),
                                        Text(_svalueerror,
                                            style: TextStyle(
                                                color: pink, fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1)
                                      ]))
                                  : new Text('')),
                        ],
                      )),

                  new Align(
                      alignment: Alignment.centerRight,
                      child: new Padding(
                        padding: EdgeInsets.only(top: 7, bottom: 0, right: 15),
                        child: RaisedButton(
                          onPressed: _validateInputs,
                          // _validateInputs,
                          color: active,
                          textColor: Colors.white,
                          disabledTextColor: Colors.white,
                          child: new Text('Save',
                              style: new TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'SairaSemiCondensed')),
                        ),
                      )),

                  // new RaisedButton(
                  //   onPressed: _selectDate,
                  //   child: new Text('Click me'),
                  // )
                ],
                // ),
              ))
        ]);
  }

  String validateCode(String value) {
    RegExp regex = new RegExp('[0-9]');
    if (value.length == 0)
      return 'Code is required';
    else if (!regex.hasMatch(value))
      return 'Invalid Code';
    else
      return '';
  }

  String validateName(String value) {
    RegExp regex = new RegExp('[a-zA-Z]');
    if (value.length == 0)
      return 'Full Name is required.';
    else if (!regex.hasMatch(value))
      return 'Invalid Full Name';
    else
      return '';
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) return 'Email ID is required.';
    if (!regex.hasMatch(value))
      return 'Invalid Email ID.';
    else
      return '';
  }

  String validateDOB(String value) {
    if (value == '') {
      return 'Date of Birth is required.';
    } else
      return '';
  }

  String validateSpouseName(String value) {
    RegExp regex = new RegExp('[a-zA-Z]');
    if (value.length < 1)
      return 'Name of the Spouse is required.';
    // else if (!regex.hasMatch(value))
    //   return 'Invalid Spouse Name';
    else
      return '';
  }

  String validateSpouseDOB(String value) {
    if (value.length < 1)
      return 'Birthdate of Spouse is required.';
    else
      return '';
  }

  bool validation() {
    var isValidate = true;

    setState(() {
      _nameerror = validateName(_name);
      _codeerror = validateCode(_code);
      _emailerror = validateEmail(_email);
      _valuedoberror = validateDOB(txt.text);
      _snameerror = validateSpouseName(_sname);
      _svalueerror = validateSpouseDOB(txt1.text);
    });
    return isValidate;
  }

  void _validateInputs() {
    if (validation()) {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().subtract(new Duration(days: (365 * 100))),
        lastDate: new DateTime.now());
    if (picked != null)
      setState(() {
        txt.text = new DateFormat.yMMMd().format(picked);
        _valuedoberror = '';
        validateDOB(txt.text);
      });
  }

  Future _selectSpouseDate() async {
    var currentYear = DateTime.now().year;
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(currentYear - 100),
        lastDate: new DateTime.now());
    if (picked != null)
      setState(() {
        txt1.text = new DateFormat.yMMMd().format(picked);
        _svalueerror = '';
      });
  }
}
