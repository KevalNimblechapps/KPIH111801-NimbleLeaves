import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

const active = const Color.fromRGBO(78, 125, 254, 1);
const greydark = const Color.fromRGBO(119, 140, 161, 1);
const greylight = const Color.fromRGBO(237, 237, 237, 1);

class Toaster {
  Future<void> showFlushbar(
      BuildContext context, String message, icon, bool isUndo) async {
    Flushbar flush;
    return flush = Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      aroundPadding: 0,
      borderRadius: 5,
    )
      ..title = null
      ..titleText = null
      ..messageText = Text(
        message,
        style: TextStyle(
            color: greydark,
            height: 0.8,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: 'SairaSemiCondensed'),
      )
      ..duration = Duration(seconds: 10)
      ..icon = Icon(
        icon,
        color: greydark,
        size: 16,
      )
      ..undoButton = isUndo
          ? MaterialButton(
              minWidth: 50,
              onPressed: () {
                flush.dismiss(true); // result = true
              },
              padding: EdgeInsets.zero,
              child: Text(
                "Undo",
                style: TextStyle(
                    color: active,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'SairaSemiCondensed'),
              ),
            )
          : null
      ..mainButton = MaterialButton(
        onPressed: () {
          flush.dismiss(true); // result = true
        },
        minWidth: 50,
        child: Text(
          "Close",
          style: TextStyle(
              color: greydark,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'SairaSemiCondensed'),
        ),
      )
      ..backgroundColor = Colors.transparent
      ..isDismissible = true
      ..shadowColor = Colors.grey[200]
      ..showProgressIndicator = true
      ..progressIndicatorBackgroundColor = active
      // ..progressIndicatorController = controller
      ..progressIndicatorValueColor =
          new AlwaysStoppedAnimation<Color>(Colors.white)
      ..show(context);
  }
}

// class Toaster extends StatefulWidget {
//   @override
//   ToasterState createState() {
//     return new ToasterState();
//   }
// }

// class ToasterState extends State<Toaster> {
//   @override
//   Flushbar flush;

// Widget build(BuildContext context) {
//   return new Flushbar(
//     flushbarPosition: FlushbarPosition.TOP,
//     aroundPadding: 0,
//     borderRadius: 5,
//     forwardAnimationCurve: Curves.linear,
//     reverseAnimationCurve: Curves.linear,
//   )
//     ..title = null
//     ..titleText = null
//     ..messageText = Text(
//       'Unplanned leave edited successfully.',
//       style: TextStyle(
//           color: greydark,
//           height: 0.8,
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//           fontFamily: 'SairaSemiCondensed'),
//     )
//     ..duration = Duration(seconds: 10)
//     ..icon = Icon(
//       CustomIcons.verified,
//       color: greydark,
//       size: 16,
//     )
//     ..mainButton = FlatButton(
//       onPressed: () {
//         flush.dismiss(true); // result = true
//       },
//       child: Text(
//         "Close",
//         style: TextStyle(
//             color: greydark,
//             fontWeight: FontWeight.w600,
//             fontSize: 16,
//             fontFamily: 'SairaSemiCondensed'),
//       ),
//     )
//     ..backgroundColor = Colors.red
//     ..isDismissible = true
//     ..shadowColor = Colors.grey[200]
//     ..showProgressIndicator = true
//     ..progressIndicatorBackgroundColor = active
//     // ..progressIndicatorController = controller
//     ..progressIndicatorValueColor =
//         new AlwaysStoppedAnimation<Color>(Colors.white)
//     ..forwardAnimationCurve
//     ..show(context);
// }
// }
