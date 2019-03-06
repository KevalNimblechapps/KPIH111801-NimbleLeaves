import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';

class CustomTextStyle {
  static TextStyle font16(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(
        fontSize: 16.0,
        color: CustomColors.inactive,
        fontWeight: FontWeight.w700);
  }

  static TextStyle font14(BuildContext context) {
    return Theme.of(context).textTheme.display3.copyWith(
        fontSize: 14.0,
        color: CustomColors.inactive,
        fontWeight: FontWeight.normal);
  }

  static TextStyle list(BuildContext context) {
    return Theme.of(context).textTheme.display3.copyWith(
        fontSize: 14.0,
        color: CustomColors.active,
        fontWeight: FontWeight.w500);
  }
}

class SendEmail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SimpleDialog(
        contentPadding: EdgeInsets.all(0.0),
        titlePadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3))),
        title: new Container(
          padding: const EdgeInsets.only(left: 15, right: 0),
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
              Image.asset('assests/images/logo-ipad.png',
                  width: 180, height: 36, fit: BoxFit.contain),
              IconButton(
                padding: EdgeInsets.only(right: 0),
                onPressed: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  CustomIcons.close_sm,
                  color: CustomColors.inactive,
                ),
              )
            ],
          ),
        ),
        children: <Widget>[
          new Container(
              padding: new EdgeInsets.all(15),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Dhruvit,',
                    style: CustomTextStyle.font16(context),
                  ),
                  Text(
                    'Welcome onboard at Nimblechapps',
                    style: CustomTextStyle.font16(context),
                  ),
                  Container(
                      height: 228,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: CustomColors.greylight, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 300,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Please join us in extending a warm welcome to Dhruvit Patel, who joined us today as Project Execution & Delivery Head.',
                                style: CustomTextStyle.font14(context),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              Text(
                                'Dhruvit Patel holds MCA from Ganpat University.',
                                style: CustomTextStyle.font14(context),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              Text(
                                'Prior to joining Nimblechapps, he had worked with iFlair Web Technologies Pvt. Ltd as a Project Manager. He has 8 Plus years of experience in the same domain.',
                                style: CustomTextStyle.font14(context),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Text(
                    'We welcome Dhruvit Patel to Nimblechapps family and wish him a long and successful career at Nimblechapps.',
                    style: CustomTextStyle.font14(context),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: new Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 0, right: 0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          // _validateInputs,
                          color: CustomColors.active,
                          splashColor: CustomColors.active,
                          highlightColor: CustomColors.active,
                          highlightElevation: 0,
                          elevation: 0,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
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
}
