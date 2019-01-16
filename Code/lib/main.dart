import 'package:flutter/material.dart';
import 'package:nimble_leaves/employee/ListEmployee.dart';

const active = const Color.fromRGBO(78, 125, 254, 1);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Set Raleway as the default app font
      theme: ThemeData(
        fontFamily: 'SairaSemiCondensed',
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 18.0,
          ),
          title: TextStyle(
            fontSize: 16.0,
          ),
          body1: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),

      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 250, 251, 1),
      body: Center(
          child: SizedBox(
        height: 40,
        width: 205,
        child: OutlineButton(
          // padding: EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Replace with a Row for horizontal icon + text
            children: <Widget>[
              Image.asset('assests/images/g.png', height: 22, width: 22),
              Text(
                "Log in with Google",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: active,
                  fontSize: 16,
                  fontFamily: 'SairaSemiCondensed',
                ),
              )
            ],
          ),
          borderSide: BorderSide(color: active),
          highlightColor: Color.fromRGBO(248, 250, 251, 1),
          highlightedBorderColor: active,
          splashColor: Colors.transparent,
          //  MediaQuery.of(context).size.width <= 767
          //     ? Image.asset('assests/images/login.png')
          //     : Image.asset('assests/images/login-ipad.png'),
          color: Color.fromRGBO(248, 250, 251, 1),
          highlightElevation: 0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0),
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
        ),
      )),
    );
  }
}
