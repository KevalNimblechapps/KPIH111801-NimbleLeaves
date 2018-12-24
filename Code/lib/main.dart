import 'package:flutter/material.dart';
import 'package:nimble_leaves/employee_list/employee_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowMaterialGrid: false,
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    theme: ThemeData(
      // Define the default Brightness and Colors
      brightness: Brightness.dark,
      primaryColor: Color.fromRGBO(248, 250, 251, 1),
      accentColor: Color.fromRGBO(78, 125, 254, 1),

      // Define the default Font Family
      fontFamily: 'Montserrat',
    ),
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 250, 251, 1),
      body: Center(
        child: RaisedButton(
          child: Image.asset('images/login.png'),
          color: Color.fromRGBO(248, 250, 251, 1),
          elevation: 0,
          splashColor: Color.fromRGBO(248, 250, 251, 1),
          highlightColor: Color.fromRGBO(248, 250, 251, 1),
          highlightElevation: 0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}
