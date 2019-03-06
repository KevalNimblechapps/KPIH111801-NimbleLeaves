import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Colors.dart';

class Capsule extends StatefulWidget {
  Capsule({Key key, this.type}) : super(key: key);

  final String type;
  String radioValue = '';
  String radiovalue1 = '';

  @override
  State<Capsule> createState() => _CapsuleState();
}

class _CapsuleState extends State<Capsule> with SingleTickerProviderStateMixin {
  bool right = false;
  var color;
  _CapsuleState() {
    firsthalf = (BuildContext context, List<double> animValues,
        Function updateState, String value) {
      final alpha = (animValues[0] * 255).toInt();
      return GestureDetector(
          onTap: () {
            print('value' + widget.radioValue);
            if (widget.radioValue == '') {
              setState(() {
                widget.radioValue = value;
              });
            } else {
              if (widget.radioValue != '') {
                setState(() {
                  widget.radioValue = '';
                });
              } else {
                setState(() {
                  widget.radioValue = value;
                });
              }
            }
          },
          child: Container(
              height: 15,
              width: 24,
              margin: EdgeInsets.only(right: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: color.withAlpha(alpha),
                  borderRadius: widget.radioValue == ""
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15))
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                  border: Border.all(
                    color: color.withAlpha(255 - alpha),
                    width: 2.0,
                  )),
              child: Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(fontSize: 10.0, color: Colors.white, height: 0.9),
              )));
    };
    secondhalf = (BuildContext context, List<double> animValues,
        Function updateState, String value) {
      final alpha = (animValues[0] * 255).toInt();
      return GestureDetector(
          onTap: () {
            if (widget.radiovalue1 == '') {
              setState(() {
                widget.radiovalue1 = value;
              });
            } else {
              if (widget.radiovalue1 != '') {
                setState(() {
                  widget.radiovalue1 = '';
                });
              } else {
                setState(() {
                  widget.radiovalue1 = value;
                });
              }
            }
          },
          child: Container(
              height: 15,
              width: 24,
              margin: EdgeInsets.only(right: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: color.withAlpha(alpha),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  border: Border.all(
                    color: color.withAlpha(255 - alpha),
                    width: 2.0,
                  )),
              child: Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(fontSize: 10.0, color: Colors.white, height: 0.9),
              )));
    };
  }

  RadioBuilder<String, double> firsthalf;
  RadioBuilder<String, double> secondhalf;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == "planned") {
      color = CustomColors.planned;
    } else {
      if (widget.type == "emergency") {
        color = CustomColors.emergency;
      } else {
        if (widget.type == "sick") {
          color = CustomColors.sick;
        } else {
          if (widget.type == "late") {
            color = CustomColors.late;
          } else {
            if (widget.type == "employeeBirthday") {
              color = CustomColors.employeeBirthday;
            } else {
              color = CustomColors.spouseBirthday;
            }
          }
        }
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomRadio<String, double>(
            value: '50',
            groupValue: widget.radioValue,
            duration: Duration(milliseconds: 400),
            animsBuilder: (AnimationController controller) =>
                [CurvedAnimation(parent: controller, curve: Curves.easeInOut)],
            builder: firsthalf),
        CustomRadio<String, double>(
            value: '45',
            groupValue: widget.radiovalue1,
            animsBuilder: (AnimationController controller) =>
                [CurvedAnimation(parent: controller, curve: Curves.easeInOut)],
            builder: secondhalf),
      ],
    );
  }
}
