import 'package:flutter/material.dart';
import 'package:nimble_leaves/employee_list/employee_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowMaterialGrid: false,
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
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
          child: MediaQuery.of(context).size.width <= 767
              ? Image.asset('images/login.png')
              : Image.asset('images/login-ipad.png'),
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
