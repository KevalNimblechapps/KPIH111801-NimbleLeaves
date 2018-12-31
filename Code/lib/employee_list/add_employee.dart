import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
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

class _AddEmployeeState extends State<AddEmployee> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _sname;
  String _svalue;
  String _value = '';
  String _valuedob = '';
  DateTime date;
  final dateFormat = DateFormat("MMMM d, yyyy");
  @override
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
              child: new Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: '005',
                      enabled: false, // Use email input type for emails.
                      decoration: new InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 15, right: 15),
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
                              fontFamily: 'SairaSemiCondensed'),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: greymedium, width: 0.8),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    new TextFormField(
                      keyboardType: TextInputType
                          .text, // Use email input type for emails.
                      decoration: new InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 15, right: 15),
                          hintText: '',
                          labelText: 'Full Name',
                          labelStyle: new TextStyle(
                              color: greylight,
                              fontSize: 16,
                              fontFamily: 'SairaSemiCondensed'),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: greymedium, width: 0.8),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          errorStyle: TextStyle(
                            color: pink,
                            fontSize: 12,
                          )),
                      validator: validateName,
                      onSaved: (String val) {
                        _name = val;
                      },
                    ),
                    new TextFormField(
                      keyboardType: TextInputType
                          .emailAddress, // Use email input type for emails.
                      decoration: new InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 15, right: 15),
                          hintText: '',
                          labelText: 'Email ID',
                          labelStyle: new TextStyle(
                              color: greylight,
                              fontSize: 16,
                              fontFamily: 'SairaSemiCondensed'),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: greymedium, width: 0.8),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          errorStyle: TextStyle(
                            color: pink,
                            fontSize: 12,
                          )),
                      validator: validateEmail,
                      onSaved: (String val) {
                        _email = val;
                      },
                    ),
                    DateTimePickerFormField(
                      format: dateFormat,
                      validator: (dt) =>
                          date == null ? 'DOB is required' : null,
                      dateOnly: true,
                      decoration: new InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 15, right: 0),
                          hintText: '',
                          labelText: 'Date of Birth',
                          labelStyle: new TextStyle(
                              color: greylight,
                              fontSize: 16,
                              fontFamily: 'SairaSemiCondensed'),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: greymedium, width: 0.8),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          errorStyle: TextStyle(
                            color: pink,
                            fontSize: 12,
                          )),
                      onChanged: (dt) => setState(() => date = dt),
                    ),

                    new TextFormField(
                      keyboardType: TextInputType
                          .emailAddress, // Use email input type for emails.
                      decoration: new InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 15, right: 15),
                          hintText: '',
                          labelText: 'Spouse Name',
                          labelStyle: new TextStyle(
                              color: greylight,
                              fontSize: 16,
                              fontFamily: 'SairaSemiCondensed'),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: greymedium, width: 0.8),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          errorStyle: TextStyle(
                            color: pink,
                            fontSize: 12,
                          )),
                      validator: validateSpouseName,
                      onSaved: (String val) {
                        _sname = val;
                      },
                    ),
                    DateTimePickerFormField(
                      format: dateFormat,
                      validator: (dt) =>
                          date == null ? 'Spouse DOB is required' : null,
                      dateOnly: true,
                      decoration: new InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 15, right: 0),
                          hintText: '',
                          labelText: 'Spouse DOB',
                          labelStyle: new TextStyle(
                              color: greylight,
                              fontSize: 16,
                              fontFamily: 'SairaSemiCondensed'),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: greymedium, width: 0.8),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: greymedium, width: 0.8)),
                          errorStyle: TextStyle(
                            color: pink,
                            fontSize: 12,
                          )),
                      onChanged: (dt) => setState(() => date = dt),
                    ),

                    new Align(
                        alignment: Alignment.centerRight,
                        child: new Padding(
                          padding:
                              EdgeInsets.only(top: 7, bottom: 0, right: 15),
                          child: RaisedButton(
                            onPressed: _validateInputs,
                            // _validateInputs,
                            color: active,
                            textColor: Colors.white,
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
                ),
              ))
        ]);
  }

  String validateName(String value) {
    RegExp regex = new RegExp('[a-zA-Z]');
    if (value.length == 0)
      return 'Full Name is required';
    else if (!regex.hasMatch(value))
      return 'Invalid Full Name';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Invalid Email';
    else
      return null;
  }

  String validateDOB(String value) {
    if (value.length < 1)
      return 'DOB is required';
    else
      return null;
  }

  String validateSpouseName(String value) {
    RegExp regex = new RegExp('[a-zA-Z]');
    if (value.length < 1)
      return 'Spouse Name is required';
    else if (!regex.hasMatch(value))
      return 'Invalid Spouse Name';
    else
      return null;
  }

  String validateSpouseDOB(String value) {
    if (value.length < 1)
      return 'Spouse DOB is required';
    else
      return null;
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
