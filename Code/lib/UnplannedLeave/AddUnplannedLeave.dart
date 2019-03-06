import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Capsule.dart';
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

class AddUnplannedLeave extends StatefulWidget {
  final String code;
  final String name;
  final String email;
  final String dob;
  final String sposename;
  final String sposedob;
  final VoidCallback onDelete;
  AddUnplannedLeave(
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
  State<StatefulWidget> createState() => new _AddUnplannedLeave();
  // final CustomInput input = new CustomInput();
}

enum FormType { AddUnplannedLeave }

class _AddUnplannedLeave extends State<AddUnplannedLeave> {
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
                    widget.isEdit == true
                        ? "Edit Unplanned Leave"
                        : "Add Unplanned Leave",
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomTextField(
                          labelText: "Employee Name",
                          hintText: 'Employee Name',
                          suffix: true,
                          suffixicon: 'dropdown',
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 15, right: 15),
                              child: Text(
                                'Sick/Emergency Leave',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.fieldcolor),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 8, left: 15, right: 15),
                                child: Row(
                                  children: <Widget>[
                                    Capsule(type: 'sick'),
                                    Capsule(type: 'emergency'),
                                  ],
                                ))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 15, left: 15, right: 15),
                              child: Text(
                                'Reason',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.fieldcolor),
                              ),
                            ),
                            TextField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: CustomColors.greymedium),
                                  contentPadding:
                                      EdgeInsets.only(left: 15, right: 15),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CustomColors.greymedium,
                                          width: 0.8)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CustomColors.greymedium,
                                        width: 0.8),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0))),
                              keyboardType: TextInputType.multiline,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                        ),
                        Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                          children: <Widget>[
                          Padding(
                          padding: EdgeInsets.only(left:15),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            width:150,
                            alignment: AlignmentDirectional.centerEnd,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: CustomColors.greymedium))),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Late Coming',                                
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.fieldcolor),
                              ),
                              Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: 20,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: CustomColors.inactive),
                                            contentPadding: EdgeInsets.only(
                                                left: 0, right: 0),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        CustomColors.inactive,
                                                    width: 0.8)),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: CustomColors.inactive,
                                                  width: 0.8),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0)),
                                            errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0))),
                                        keyboardType: TextInputType.multiline,
                                      )),
                                  Text(
                                    ' : ',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.inactive),
                                  ),
                                  Container(
                                      width: 20,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: CustomColors.inactive),
                                            contentPadding: EdgeInsets.only(
                                                left: 0, right: 0),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        CustomColors.inactive,
                                                    width: 0.8)),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: CustomColors.inactive,
                                                  width: 0.8),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0)),
                                            errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0))),
                                        keyboardType: TextInputType.multiline,
                                      )),
                                  Text(
                                    ' AM',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.3,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.inactive),
                                  ),
                                ],
                              )
                            ],
                          ))),
                        Container(
                          margin: EdgeInsets.only(left: 2, right:2),
                        color: CustomColors.greylight,
                        width:1,
                        height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right:15),
                          child:Container(
                            padding: EdgeInsets.only(bottom: 10),
                            width:150,
                            alignment: AlignmentDirectional.centerEnd,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: CustomColors.greymedium) )
                            ),
                            child: 
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Early Going',                                
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.fieldcolor),
                              ),
                              Row(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                      width: 20,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: CustomColors.inactive),
                                            contentPadding: EdgeInsets.only(
                                                left: 0, right: 0),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        CustomColors.inactive,
                                                    width: 0.8)),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: CustomColors.inactive,
                                                  width: 0.8),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0)),
                                            errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0))),
                                        keyboardType: TextInputType.multiline,
                                      )),
                                  Text(
                                    ' : ',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.inactive),
                                  ),
                                  Container(
                                      width: 20,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: CustomColors.inactive),
                                            contentPadding: EdgeInsets.only(
                                                left: 0, right: 0),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        CustomColors.inactive,
                                                    width: 0.8)),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: CustomColors.inactive,
                                                  width: 0.8),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0)),
                                            errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0))),
                                        keyboardType: TextInputType.multiline,
                                      )),
                                  Text(
                                    ' PM',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.3,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.inactive),
                                  ),
                                ],
                              )
                            ], 
                          ))
                         ) ]),
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
                      ],
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
                  ],
                ),
              )
            ]),
          );
  }

  String validateName(String value) {
    RegExp regex = new RegExp(r'[@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
    // String regx = "^[\\p{L} .'-]+$";
    setState(() {
      _namevalid = false;
    });

    if (value.length == 0) {
      return 'Employee Name is required.';
    } else if (regex.hasMatch(value)) {
      return 'Invalid Employee Name.';
    } else {
      setState(() {
        _namevalid = true;
      });
    }
    return '';
  }

  bool validation() {
    bool isValidate = false;

    if (_namevalid == true) {
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
            ? "Unplanned Leave edited successfully"
            : "Unplanned Leave saved successfully",
        "",
        true,
        CustomIcons.verified,
        false,
      );
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
