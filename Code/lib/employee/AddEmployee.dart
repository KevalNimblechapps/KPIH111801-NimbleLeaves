import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:nimble_leaves/component/CustomTextField.dart';
import 'package:intl/intl.dart';
import 'package:nimble_leaves/component/Toaster.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';

class CustomTheme extends Theme {
  CustomTheme(Widget child)
      : super(
          child: child,
          data: new ThemeData(
            primaryColor: CustomColors.active,
            accentColor: CustomColors.active,
            cardColor: CustomColors.active,
            backgroundColor: CustomColors.active,
            splashColor: CustomColors.active,
          ),
        );
}

class CustomTextStyle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(
        fontSize: 16.0,
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

class AddEmployee extends StatefulWidget {
  final String code;
  final String name;
  final String email;
  final String dob;
  final String sposename;
  final String sposedob;
  final VoidCallback onDelete;
  AddEmployee(
      {this.isEdit = false,
      this.code,
      this.name,
      this.email,
      this.dob,
      this.sposename,
      this.onDelete,
      this.editor = false,
      this.sposedob});
  final bool isEdit;
  final bool editor;
  @override
  State<StatefulWidget> createState() => new _AddEmployeeState();
  // final CustomInput input = new CustomInput();
}

enum FormType { addEmployee }

class _AddEmployeeState extends State<AddEmployee> {
  final Toaster toast = new Toaster();
  TextEditingController _controller;
  TextEditingController name_controller;
  TextEditingController email_controller;
  TextEditingController dob_controller;
  TextEditingController spousename_controller;
  TextEditingController spousedob_controller;
  var txt = new TextEditingController();
  var txt1 = new TextEditingController();
  bool isEditMode = false;

  bool _autoValidate = false;
  String _code = "005";
  String _codeerror = "";
  bool _codevalid = true;
  String _name = "";
  String _nameerror = "";
  bool _namevalid = true;
  String _email = "";
  String _emailerror = "";
  bool _emailvalid = true;
  String _sname = "";
  String _snameerror = "";
  bool _snamevalid = true;
  String _svalueerror = "";
  bool _svaluevalid = true;
  bool _dobvalid = true;
  String _valuedoberror = '';
  DateTime date;
  final dateFormat = DateFormat("MMMM d, yyyy");
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: '005');
    name_controller =
        new TextEditingController(text: widget.isEdit ? 'Dhruvit Patel' : '');
    _name = name_controller.text;
    email_controller = new TextEditingController(
        text: widget.isEdit ? 'dhruvit@nimblechapps.com' : '');
    _email = email_controller.text;
    txt = new TextEditingController(text: widget.isEdit ? '21 Dec, 1987' : '');
    spousename_controller =
        new TextEditingController(text: widget.isEdit ? 'Kamini Patel' : '');
    _sname = spousename_controller.text;
    txt1 = new TextEditingController(text: widget.isEdit ? '13 Nov, 1991' : '');

    if (widget.editor == true) {
      setState(() {
        isEditMode = true;
      });
    } else {
      setState(() {
        isEditMode = false;
      });
    }

    if (widget.isEdit == false) {
      _namevalid = false;
      _emailvalid = false;
      _snamevalid = false;
      _svaluevalid = false;
      _dobvalid = false;
      _autoValidate = false;
    }
  }

  Widget build(BuildContext context) {
    // if (widget.editor == true) {
    //   isEditMode = true;
    // } else {
    //   isEditMode = false;
    // }
    double width = MediaQuery.of(context).size.width - 30;
    return MediaQuery.of(context).size.width <= 1023
        ? SimpleDialog(
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
                    widget.isEdit == true ? "Edit Employee" : "Add Employee",
                    style: TextStyle(
                        color: CustomColors.greydark,
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
                          color: CustomColors.greydark,
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
                        top: 5.0, left: 0, right: 0, bottom: 10),
                    child: new Column(
                      children: <Widget>[
                        CustomTextField(
                          labelText: "Code",
                          hintText: '005',
                          isEnabled: false,
                          suffix: true,
                          controller: _controller,
                          inputType: TextInputType.number,
                          onChanged: null,
                          errorText: '',
                        ),
                        CustomTextField(
                          labelText: "Full Name",
                          controller: name_controller,
                          inputType: TextInputType.text,
                          onChanged: (value) {
                            setState(() {
                              _name = value;
                              _nameerror = validateName(value);
                            });
                          },
                          errorText: _nameerror,
                        ),
                        CustomTextField(
                          labelText: "Email ID",
                          controller: email_controller,
                          inputType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                              _emailerror = validateEmail(value);
                            });
                          },
                          errorText: _emailerror,
                        ),
                        CustomTextField(
                          labelText: "Date of Birth",
                          controller: txt,
                          inputType: TextInputType.datetime,
                          onTap: _selectDate,
                          errorText: _valuedoberror,
                        ),
                        CustomTextField(
                          labelText: "Spouse Name",
                          controller: spousename_controller,
                          inputType: TextInputType.datetime,
                          onChanged: (value) {
                            setState(() {
                              _sname = value;
                              _snameerror = validateSpouseName(value);
                            });
                          },
                          errorText: _snameerror,
                        ),
                        CustomTextField(
                          labelText: "Spouse DOB",
                          controller: txt1,
                          inputType: TextInputType.datetime,
                          onTap: _selectSpouseDate,
                          errorText: _svalueerror,
                          onChanged: null,
                        ),

                        new Align(
                            alignment: Alignment.centerRight,
                            child: new Padding(
                              padding:
                                  EdgeInsets.only(top: 7, bottom: 0, right: 15),
                              child: RaisedButton(
                                onPressed: validation() == true
                                    ? _validateInputs
                                    : null,
                                // _validateInputs,
                                color: validation() == true
                                    ? CustomColors.active
                                    : CustomColors.greydark,
                                splashColor: validation() == true
                                    ? CustomColors.active
                                    : CustomColors.greydark,
                                highlightColor: validation() == true
                                    ? CustomColors.active
                                    : CustomColors.greydark,
                                highlightElevation: 0,
                                elevation: 0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
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
              ])
        : Container(
            width: MediaQuery.of(context).size.width - 30,
            margin: EdgeInsets.only(bottom: 11),
            padding: MediaQuery.of(context).size.width <= 767
                ? EdgeInsets.all(15)
                : EdgeInsets.only(left: 15, right: 0),
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
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
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
                              end: BorderSide(
                                  color: isEditMode == false
                                      ? Colors.white
                                      : CustomColors.greymedium,
                                  width: isEditMode == false ? 0 : 1))),
                      child: isEditMode == false
                          ? Text(widget.code,
                              style: CustomTextStyle.list(context))
                          : CustomTextField(
                              labelText: null,
                              hintText: null,
                              isEnabled: false,
                              contentPadding:
                                  EdgeInsets.only(left: 0, right: 0),
                              suffix: true,
                              controller: _controller,
                              inputType: TextInputType.number,
                              onChanged: null,
                              errorText: '',
                            ),
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
                              end: BorderSide(
                                  color: isEditMode == false
                                      ? Colors.white
                                      : CustomColors.greymedium,
                                  width: isEditMode == false ? 0 : 1))),
                      child: isEditMode == false
                          ? Text(widget.name,
                              style: CustomTextStyle.list(context))
                          : CustomTextField(
                              labelText: null,
                              hintText: "Full Name",
                              controller: name_controller,
                              inputType: TextInputType.text,
                              contentPadding:
                                  EdgeInsets.only(left: 0, right: 0),
                              onChanged: (value) {
                                setState(() {
                                  _name = value;
                                  _nameerror = validateName(_name);
                                });
                              },
                              errorText: _nameerror,
                            ),
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
                              end: BorderSide(
                                  color: isEditMode == false
                                      ? Colors.white
                                      : CustomColors.greymedium,
                                  width: isEditMode == false ? 0 : 1))),
                      child: isEditMode == false
                          ? Text(widget.email,
                              style: CustomTextStyle.list(context))
                          : CustomTextField(
                              labelText: null,
                              hintText: "Email ID",
                              contentPadding:
                                  EdgeInsets.only(left: 0, right: 0),
                              controller: email_controller,
                              inputType: TextInputType.emailAddress,
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                  _emailerror = validateEmail(value);
                                });
                              },
                              errorText: _emailerror,
                            ),
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
                              end: BorderSide(
                                  color: isEditMode == false
                                      ? Colors.white
                                      : CustomColors.greymedium,
                                  width: isEditMode == false ? 0 : 1))),
                      child: isEditMode == false
                          ? Text(widget.dob,
                              style: CustomTextStyle.list(context))
                          : CustomTextField(
                              labelText: null,
                              hintText: "Date of Birth",
                              controller: txt,
                              contentPadding:
                                  EdgeInsets.only(left: 0, right: 0),
                              inputType: TextInputType.datetime,
                              onTap: _selectDate,
                              errorText: _valuedoberror,
                            ),
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
                                        color: isEditMode == false
                                            ? Colors.white
                                            : CustomColors.greymedium,
                                        width: isEditMode == false ? 0 : 1))),
                            child: isEditMode == false
                                ? Text(widget.sposename,
                                    style: CustomTextStyle.list(context))
                                : CustomTextField(
                                    labelText: null,
                                    hintText: "Spouse Name",
                                    contentPadding:
                                        EdgeInsets.only(left: 0, right: 0),
                                    controller: spousename_controller,
                                    inputType: TextInputType.text,
                                    onChanged: (value) {
                                      setState(() {
                                        _sname = value;
                                        _snameerror = validateSpouseName(value);
                                      });
                                    },
                                    errorText: _snameerror,
                                  ),
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
                              end: BorderSide(
                                  color: isEditMode == false
                                      ? Colors.white
                                      : CustomColors.greymedium,
                                  width: isEditMode == false ? 0 : 1))),
                      child: isEditMode == false
                          ? Text(widget.sposedob,
                              style: CustomTextStyle.list(context))
                          : CustomTextField(
                              labelText: null,
                              hintText: "Spouse DOB",
                              contentPadding:
                                  EdgeInsets.only(left: 0, right: 0),
                              controller: txt1,
                              inputType: TextInputType.datetime,
                              onTap: _selectSpouseDate,
                              errorText: _svalueerror,
                              onChanged: null,
                            ),
                    ),
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: 48,
                        width: width >= 768 && width <= 1023
                            ? width * 0.11
                            : width * 0.13,
                        padding: EdgeInsets.only(right: 0, left: 8),
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end:
                                    BorderSide(color: Colors.white, width: 0))),
                        child: widget.editor
                            ? RaisedButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                                onPressed: validation() == true
                                    ? _validateInputs
                                    : null,
                                // _validateInputs,
                                color: CustomColors.active,
                                textColor: Colors.white,
                                disabledTextColor: Colors.white,
                                child: new Text('Save',
                                    style: new TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'SairaSemiCondensed')),
                              )
                            : isEditMode
                                ? new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // Text('jfnjkdfk'),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                      ),
                                      Container(
                                        child: new SizedBox(
                                            height: 18.0,
                                            width: 18.0,
                                            child: new IconButton(
                                              padding: new EdgeInsets.all(0.0),
                                              color: Colors.transparent,
                                              icon: new Icon(
                                                  CustomIcons.tick_rounded,
                                                  size: 18.0,
                                                  color: CustomColors.active),
                                              onPressed: () {
                                                // if (widget.editor == false)
                                                setState(() {
                                                  isEditMode = false;
                                                });
                                              },
                                            )),
                                        margin: EdgeInsets.only(
                                            right: 20.0, bottom: 5),
                                      ),

                                      Container(
                                        child: new SizedBox(
                                            height: 18.0,
                                            width: 18.0,
                                            child: new IconButton(
                                              padding: new EdgeInsets.all(0.0),
                                              color: Colors.transparent,
                                              icon: new Icon(
                                                  CustomIcons.close_rounded,
                                                  size: 18.0,
                                                  color: CustomColors.inactive),
                                              onPressed: () {
                                                // if (widget.editor == false)
                                                setState(() {
                                                  isEditMode = false;
                                                });
                                              },
                                            )),
                                        margin: EdgeInsets.only(bottom: 5.0),
                                      ),
                                    ],
                                  )
                                : new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // Text('jfnjkdfk'),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
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
                                              onPressed: MediaQuery.of(context)
                                                          .size
                                                          .width <=
                                                      1023
                                                  ? () {
                                                      showDialog(
                                                          context: context,
                                                          child:
                                                              new AddEmployee(
                                                            isEdit: true,
                                                          ));
                                                    }
                                                  : () {
                                                      // if (widget.editor == false)
                                                      setState(() {
                                                        isEditMode = true;
                                                      });
                                                    },
                                            )),
                                        margin: EdgeInsets.only(
                                            right: 20.0, bottom: 5),
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

  String validateCode(String value) {
    RegExp regex = new RegExp('[0-9]');

    if (value.length == 0)
      return 'Code is required';
    else if (!regex.hasMatch(value))
      return 'Invalid Code';
    else {
      setState(() {
        _codevalid = true;
      });
      return '';
    }
  }

  String validateName(String value) {
    RegExp regex = new RegExp(r'[@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
    // String regx = "^[\\p{L} .'-]+$";
    setState(() {
      _namevalid = false;
    });

    if (value.length == 0) {
      return 'Full name is required.';
    } else if (regex.hasMatch(value)) {
      return 'Invalid Full Name.';
    } else {
      setState(() {
        _namevalid = true;
      });
    }
    return '';
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    setState(() {
      _emailvalid = false;
    });
    if (value.length == 0) return 'Email ID is required.';
    if (!regex.hasMatch(value))
      return 'Invalid Email ID.';
    else {
      setState(() {
        _emailvalid = true;
      });
      return '';
    }
  }

  String validateDOB(String value) {
    setState(() {
      _dobvalid = false;
    });
    if (value == '') {
      return 'Date of Birth is required.';
    } else {
      setState(() {
        _dobvalid = true;
      });
      return '';
    }
  }

  String validateSpouseName(String value) {
    setState(() {
      _snamevalid = false;
    });
    RegExp regex = new RegExp(r'[@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
    if (value.length < 1)
      return 'Name of the Spouse is required.';
    else if (regex.hasMatch(value))
      return 'Invalid Spouse Name';
    else {
      setState(() {
        _snamevalid = true;
      });

      return '';
    }
  }

  String validateSpouseDOB(String value) {
    setState(() {
      _svaluevalid = false;
    });
    if (value.length < 1)
      return 'Birthdate of Spouse is required.';
    else {
      setState(() {
        _svaluevalid = true;
      });
      return '';
    }
  }

  bool validation() {
    bool isValidate = false;

    if (_namevalid == true &&
        _emailvalid == true &&
        _dobvalid == true &&
        _snamevalid == true &&
        _svaluevalid == true) {
      isValidate = true;
    }

    return isValidate;
  }

  void _validateInputs() {
    if (validation() == true) {
      MediaQuery.of(context).size.width <= 1023 ? Navigator.pop(context) : null;
      toast.showFlushbar(
        context,
        widget.isEdit
            ? "Employee edited successfully"
            : "Employee added successfully",
        widget.isEdit ? "" : "Send welcome email",
        true,
        CustomIcons.verified,
        false,
      );
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
        txt.text = new DateFormat.d().format(picked) +
            ' ' +
            new DateFormat.MMM().format(picked) +
            ', ' +
            new DateFormat.y().format(picked);
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
        txt1.text = new DateFormat.d().format(picked) +
            ' ' +
            new DateFormat.MMM().format(picked) +
            ', ' +
            new DateFormat.y().format(picked);
        _svalueerror = '';
        validateSpouseDOB(txt1.text);
      });
  }
}
