import 'package:dmp_flutter/actions/action.dart';
import 'package:dmp_flutter/navigation/routes.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:dmp_flutter/states/loading_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        return {
          "loadingState": store.state.loginState.loadingState,
          "error": store.state.loginState.error,
          "setToken": () => store.dispatch(
              saveToPrefs('authToken', store.state.loginState.authToken)),
          "callback": () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              store.dispatch(startLoginAction(_formData));
            }
          }
        };
      },
      onWillChange: (viewModel) {
        if (viewModel['loadingState'] == LoadingState.SUCCESS) {
          viewModel['setToken']();
          Routes.router.navigateTo(context, Routes.customerHome,
              replace: true, clearStack: true);
        }
      },
      onDidChange: (viewModel) {
        if (viewModel['loadingState'] == LoadingState.ERROR) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(viewModel['error']),
          ));
        }
      },
      builder: (context, viewModel) {
        return Container(
            padding: const EdgeInsets.all(32.0),
            child: Center(
                child: viewModel['loadingState'] == LoadingState.LOADING
                    ? CircularProgressIndicator()
                    : buildLoginForm(viewModel['callback'])));
      },
    );
  }

  Column buildLoginForm(callback) {
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
                onPressed: callback,
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
