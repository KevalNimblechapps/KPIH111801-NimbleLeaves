import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nimble_leaves/component/Colors.dart';
import 'package:nimble_leaves/employee/SendEmail.dart';

class Toaster {
  Future<void> showFlushbar(BuildContext context, String message, String extra,
      bool onDelete, icon, bool isUndo) async {
    Flushbar flush;
    return flush = Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      aroundPadding: 0,
      borderRadius: 5,
    )
      ..title = null
      ..titleText = extra != "" && onDelete == false
          ? Text(
              message,
              softWrap: true,
              style: TextStyle(
                  color: CustomColors.greydark,
                  height: 0.8,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'SairaSemiCondensed'),
            )
          : Text(
              message,
              softWrap: true,
              style: TextStyle(
                  color: CustomColors.greydark,
                  height: 0.8,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'SairaSemiCondensed'),
            )
      ..messageText = extra != ""
          ? Text(
              extra,
              softWrap: true,
              style: TextStyle(
                  color: CustomColors.active,
                  height: 0.2,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'SairaSemiCondensed'),
            )
          : Text(
              message,
              softWrap: true,
              style: TextStyle(
                  color: CustomColors.greydark,
                  height: 0.0,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'SairaSemiCondensed'),
            )
      ..duration = Duration(seconds: extra != "" ? 20 : 10)
      ..icon = Icon(
        icon,
        color: CustomColors.greydark,
        size: 16,
      )
      // ..onsendemail = onDelete && extra != ""
      //     ? MaterialButton(
      //         height: 15,
      //         onPressed: () {
      //           flush.dismiss(true);
      //           showDialog(
      //               context: context, child: new SendEmail()); // result = true
      //         },
      //         padding: EdgeInsets.zero,
      //         child: Text(
      //           "Send Welcome Email",
      //           style: TextStyle(
      //               color: CustomColors.active,
      //               fontWeight: FontWeight.w600,
      //               fontSize: 14,
      //               height: 0.1,
      //               fontFamily: 'SairaSemiCondensed'),
      //         ),
      //       )
      //     : null
      // ..undoButton = isUndo
      //     ? MaterialButton(
      //         minWidth: 40,
      //         height: 12,
      //         onPressed: () {
      //           flush.dismiss(true); // result = true
      //         },
      //         padding: EdgeInsets.zero,
      //         child: Text(
      //           "Undo",
      //           style: TextStyle(
      //               color: CustomColors.active,
      //               fontWeight: FontWeight.w600,
      //               fontSize: 14,
      //               fontFamily: 'SairaSemiCondensed'),
      //         ),
      //       )
      //     : null
      // ..mainButton = MaterialButton(
      //   onPressed: () {
      //     flush.dismiss(true); // result = true
      //   },
      //   minWidth: 40,
      //   height: 12,
      //   padding: EdgeInsets.all(0),
      //   child: Text(
      //     "Close",
      //     style: TextStyle(
      //         color: CustomColors.greydark,
      //         fontWeight: FontWeight.w600,
      //         fontSize: 14,
      //         fontFamily: 'SairaSemiCondensed'),
      //   ),
      // )
      ..backgroundColor = Colors.transparent
      ..isDismissible = true
      ..shadowColor = Colors.grey[200]
      ..showProgressIndicator = true
      ..progressIndicatorBackgroundColor = CustomColors.active
      // ..progressIndicatorController = controller
      ..progressIndicatorValueColor =
          new AlwaysStoppedAnimation<Color>(Colors.white)
      ..show(context);
  }
}
