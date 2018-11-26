import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {

  TextCard({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {

    double left = 32.0, right = 32.0, top = 16.0, bottom = 32.0;

    return Card(
      elevation: 16.0,
      child: Container(
          padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          child: this.child
      ),
    );
  }

}