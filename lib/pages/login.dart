import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/text_card.dart';
import '../components/padded_text_field.dart';
import '../components/padded_text.dart';
import 'package:dmp_flutter/navigation/routes.dart';


class Login extends StatelessWidget {
  String title;

  BuildContext context;

  Login({String title}) {
    this.title = title;
  }

  void onLoginPressed() {
    Routes.router.navigateTo(context, "/customer/home", transition: TransitionType.fadeIn);
  }

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/loginBg.jpeg'),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
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
                              shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: PaddedText(
                                text: 'LOGIN',
                                padding: EdgeInsets.fromLTRB(48.0, 16.0, 48.0, 16.0),
                                color: Colors.white,
                              )
                          )
                        ],
                      ),
                      PaddedText(
                        text: 'New User? Signup',
                        color: Colors.black45,
                        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                      )
                    ],
                  )
              )
          )
        ],
      )
    );
  }
}
