import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
          // child: Image.asset('images/login.png'),
          color: Color.fromRGBO(248, 250, 251, 1),
          elevation: 0,
          splashColor: Color.fromRGBO(248, 250, 251, 1),
          highlightColor: Color.fromRGBO(248, 250, 251, 1),
          highlightElevation: 0,
          // onPressed: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => SecondScreen()),
          //   );
          // },
        ),
      ),
    );
  }
}
