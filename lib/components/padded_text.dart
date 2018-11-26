import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {

  PaddedText({@required this.text, @required this.padding, this.textAlign, this.color: const Color(0xff004ba0)});

  final String text;
  final EdgeInsets padding;
  final TextAlign textAlign;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: this.padding,
      child: Text(
        this.text,
        textAlign: this.textAlign,
        style: TextStyle(
          color: this.color
        )
      ),
    );
  }

}