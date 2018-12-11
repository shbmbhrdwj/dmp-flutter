import 'package:dmp_flutter/components/padded_text.dart';
import 'package:flutter/material.dart';

class FlatButtonWithRightIcon extends StatelessWidget {
  const FlatButtonWithRightIcon({
    Key key,
    this.text,
    this.icon,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          PaddedText(
            text: text,
            padding: EdgeInsets.only(right: 8),
          ),
          Icon(
            icon,
            size: 12,
          )
        ],
      ),
      textColor: Colors.lightBlue[900],
      onPressed: this.onPressed,
    );
  }
}
