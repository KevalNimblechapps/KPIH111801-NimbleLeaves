import 'package:flutter/material.dart';

// void main() => runApp(new MaterialApp(
//       title: 'Forms in Flutter',
//       home: new LoginPage(),
//     ));

const active = const Color.fromRGBO(78, 125, 254, 1);
const greydark = const Color.fromRGBO(119, 140, 161, 1);
const greylight = const Color.fromRGBO(193, 193, 193, 1);

class AddEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddEmployeeState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _AddEmployeeState extends State<AddEmployee> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _sname;
  String _svalue;
  String _value = '';

  @override
  Widget build(BuildContext context) {
    Future _selectDate() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2016),
          lastDate: new DateTime(2019));
      if (picked != null) setState(() => _value = picked.toString());
    }

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
                  color: Colors.grey,
                  blurRadius: 4.0,
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
              padding: new EdgeInsets.only(
                  top: 5.0, left: 15, right: 15, bottom: 10),
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
                          hintText: '005',
                          labelText: 'Code',
                          suffixIcon: Icon(
                            Icons.block,
                            size: 21,
                            color: greylight,
                          ),
                          labelStyle: new TextStyle(color: Colors.grey),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.green, width: 3.0),
                          ),
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
                        hintText: '',
                        labelText: 'Full Name',
                        labelStyle: new TextStyle(color: Colors.grey),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: validateName,
                      onSaved: (String val) {
                        _name = val;
                      },
                    ),
                    new TextFormField(
                      keyboardType: TextInputType
                          .emailAddress, // Use email input type for emails.
                      decoration: new InputDecoration(
                        hintText: '',
                        labelText: 'Email ID',
                        labelStyle: new TextStyle(color: Colors.grey),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: validateEmail,
                      onSaved: (String val) {
                        _email = val;
                      },
                    ),

                    GestureDetector(
                        onTap: _selectDate,
                        child: AbsorbPointer(
                          child: new TextFormField(
                            keyboardType: null,
                            initialValue: _value,
                            decoration: new InputDecoration(
                              hintText: '',
                              labelText: 'Date of Birth',
                              labelStyle: new TextStyle(color: Colors.grey),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: validateDOB,
                            onSaved: (String val) {
                              _value = val;
                            },
                          ),
                        )),
                    new TextFormField(
                      keyboardType: TextInputType
                          .emailAddress, // Use email input type for emails.
                      decoration: new InputDecoration(
                        hintText: '',
                        labelText: 'Spouse Name',
                        labelStyle: new TextStyle(color: Colors.grey),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: validateSpouseName,
                      onSaved: (String val) {
                        _sname = val;
                      },
                    ),
                    new TextFormField(
                      keyboardType: TextInputType
                          .emailAddress, // Use email input type for emails.
                      decoration: new InputDecoration(
                        hintText: '',
                        labelText: 'Spouse DOB',
                        labelStyle: new TextStyle(color: Colors.grey),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: validateSpouseDOB,
                      onSaved: (String val) {
                        _svalue = val;
                      },
                    ),
                    new Align(
                        alignment: Alignment.centerRight,
                        child: new Padding(
                          padding: EdgeInsets.only(top: 7, bottom: 0),
                          child: RaisedButton(
                            onPressed: _validateInputs,
                            color: active,
                            textColor: Colors.white,
                            child: new Text('Save'),
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
