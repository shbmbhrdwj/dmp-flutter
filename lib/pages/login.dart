import 'package:flutter/material.dart';
import '../components/text_card.dart';
import '../components/padded_text_field.dart';
import '../components/padded_text.dart';

class Login extends StatelessWidget {
  String title;

  Login({String title}) {
    this.title = title;
  }

  void onLoginPressed() {
    print('Pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'Login',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900
                        )
                    ),
                    PaddedTextField(
                      labelText: 'Username',
                      padding: EdgeInsets.all(8.0),
                    ),
                    PaddedTextField(
                      labelText: 'Password',
                      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 16.0),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: PaddedText(
                            text: 'Forgot Password ?',
                            textAlign: TextAlign.end,
                            padding: EdgeInsets.all(8.0),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    onPressed: this.onLoginPressed,
                    color: Colors.blue,
                    elevation: 16,
                    child: PaddedText(
                      text: 'LOGIN',
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                      color: Colors.white,
                    )
                  )
                ],
              )
            ],
          )
        )
      )
    );
  }
}
