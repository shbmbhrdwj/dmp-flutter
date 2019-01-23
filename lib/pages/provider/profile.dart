import 'package:flutter/material.dart';

class ProviderProfile extends StatelessWidget {
  final String providerId;

  ProviderProfile({this.providerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Profile'),
      ),
      body: Container(),
    );
  }
}
