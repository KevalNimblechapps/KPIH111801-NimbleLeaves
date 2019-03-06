import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Colors.dart';

class CustomCheckbox extends StatefulWidget {
  @override
  _State createState() => _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<CustomCheckbox> {
  bool _value1 = false;
  bool _value2 = false;

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 66,
      decoration: BoxDecoration(
          border: Border.all(color: CustomColors.greymedium, width: 1),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.scale(
              scale: 0.5,
              child: Checkbox(
                value: _value1,
                onChanged: _value1Changed,
                activeColor: Colors.transparent,
              )),
          Text('30')
        ],
      ),
    );
  }
}
