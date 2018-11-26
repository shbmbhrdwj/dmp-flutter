import 'package:flutter/material.dart';

class PaddedTextField extends StatelessWidget {

  PaddedTextField({@required this.labelText, @required this.padding});

  final String labelText;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: this.padding,
      child: TextField(
        decoration: InputDecoration(
          labelText: this.labelText,
        ),
      ),
    );
  }

}