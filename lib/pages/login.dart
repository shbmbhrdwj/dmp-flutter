import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  String title;

  Login({String title}) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField()
          ],
        ),
      )
    );
  }
}
