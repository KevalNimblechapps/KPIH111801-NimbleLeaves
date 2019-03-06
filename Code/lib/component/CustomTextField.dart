import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:nimble_leaves/component/custom_icons_icons.dart';

class CustomTextStyle {
  static TextStyle labelstyle(BuildContext context) {
    return MediaQuery.of(context).size.width <= 1023
        ? Theme.of(context).textTheme.display4.copyWith(
              color: CustomColors.fieldcolor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
        : Theme.of(context).textTheme.display3.copyWith(
            fontSize: 14.0,
            color: CustomColors.inactive,
            fontWeight: FontWeight.w500);
  }
}

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {this.hintText,
      this.labelText,
      this.errorText = "",
      this.isEnabled,
      this.isSecureText = false,
      this.controller,
      this.inputType,
      this.suffix = false,
      this.onChanged,
      this.suffixicon = '',
      this.contentPadding =
          const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 3),
      this.onTap});

  final String labelText;
  final EdgeInsetsGeometry contentPadding;
  final String hintText;
  final String errorText;
  final bool suffix;
  final bool isEnabled;
  final bool isSecureText;
  final String suffixicon;

  final TextInputType inputType;
  final ValueChanged onChanged;
  final GestureTapCallback onTap;
  TextEditingController controller;
  @override
  State<StatefulWidget> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    double borderwidth = MediaQuery.of(context).size.width >= 1023 ? 0.0 : 0.8;
    Color bordercolor = MediaQuery.of(context).size.width >= 1023
        ? Colors.transparent
        : CustomColors.greymedium;

    return new Container(
        padding: EdgeInsets.all(0),
        alignment: AlignmentDirectional.centerStart,
        constraints: new BoxConstraints.expand(
            height: MediaQuery.of(context).size.width >= 1024 ? 48.0 : 60.0),
        child: new Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            TextField(
                keyboardType: widget.inputType,
                controller: widget.controller,
                enabled: widget.isEnabled,
                textInputAction: TextInputAction.next,
                obscureText: widget.isSecureText,
                decoration: InputDecoration(
                  contentPadding: widget.contentPadding,
                  hintText: widget.hintText,
                  labelText: widget.labelText,
                  labelStyle: CustomTextStyle.labelstyle(context),
                  suffix: widget.suffix
                      ? widget.suffixicon == ''
                          ? new Icon(
                              Icons.block,
                              size: 16,
                              color: CustomColors.greylight,
                            )
                          : new Icon(
                              CustomIcons.dropdown,
                              size: 14,
                              color: CustomColors.inactive,
                            )
                      : null,
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: bordercolor, width: borderwidth)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: bordercolor, width: borderwidth),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: bordercolor, width: borderwidth)),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: bordercolor, width: borderwidth)),
                  errorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: bordercolor, width: borderwidth)),
                ),
                onChanged: widget.onChanged,
                onTap: widget.onTap),
            Positioned(
              left: MediaQuery.of(context).size.width >= 1024 ? 0 : 15.0,
              bottom: MediaQuery.of(context).size.width >= 1024 ? -30.0 : -21.0,
              child: widget.errorText != ""
                  ? new Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 1, bottom: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(5.0),
                              bottomRight: const Radius.circular(5.0)),
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
                          color: CustomColors.pink,
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        Text(widget.errorText,
                            style: TextStyle(
                                color: CustomColors.pink, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1)
                      ]))
                  : Text(''),
            ),
          ],
        ));
  }
}
