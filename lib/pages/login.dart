import 'dart:convert';

import 'package:dmp_flutter/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dmp_flutter/config/ApiClient.dart';
import 'package:dmp_flutter/utils/validator.dart';
import 'package:flutter/material.dart';

import '../components/text_card.dart';
import '../components/padded_text_field.dart';
import '../components/padded_text.dart';

class Login extends StatelessWidget {
  final String title;

  Login({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('assets/graphics/loginBg.jpeg'),
                  fit: BoxFit.cover)),
        ),
        LoginForm()
      ],
    ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  Map<String, String> _formData = {"email": null, "password": null};
  var _showForm = true;

  void onLoginPressed() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _showForm = false;
      });
      var response = await ApiClient.postTo("/login", _formData);

      Map<String, dynamic> body = json.decode(response.body);

      if (body["status"] < 0) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(body["message"])));
        setState(() {
          _showForm = true;
        });
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("authToken", body["data"]["token"]);
        Routes.router.navigateTo(context, Routes.customerHome,
            replace: true, clearStack: true);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
            child: _showForm ? buildLoginForm() : CircularProgressIndicator()));
  }

  Column buildLoginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextCard(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Login',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900)),
                PaddedTextField(
                  labelText: 'Email',
                  padding: EdgeInsets.all(8.0),
                  keyboardType: TextInputType.emailAddress,
                  initialValue: _formData["email"],
                  onSaved: (value) {
                    _formData["email"] = value;
                  },
                  validator: (String value) {
                    return new Validator(entityName: "Email")
                        .add(Rules.EMAIL, value)
                        .runRules();
                  },
                ),
                PaddedTextField(
                  obscureText: true,
                  labelText: 'Password',
                  onSaved: (value) {
                    _formData["password"] = value;
                  },
                  padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 16.0),
                  validator: (String value) {
                    return new Validator(entityName: "Password").add(
                        Rules.MIN_LENTH, value, {"minLength": 6}).runRules();
                  },
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
        ),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
                onPressed: this.onLoginPressed,
                color: Colors.blue,
                elevation: 16,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: PaddedText(
                  text: 'LOGIN',
                  padding: EdgeInsets.fromLTRB(48.0, 16.0, 48.0, 16.0),
                  color: Colors.white,
                ))
          ],
        ),
        PaddedText(
          text: 'New User? Signup',
          color: Colors.black45,
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        )
      ],
    );
  }
}
