import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchAppBar {
  static AppBar build(BuildContext context, String title,
      [void Function(String query) onSearchPressed]) {
    var widget = AppBar(
        title: Text("Home"),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              color: Colors.lightBlue[50],
              elevation: 8,
              margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          hintStyle: TextStyle(),
                          hintText: 'Search here...',
                        ),
                        autocorrect: false,
                      ),
                    ),
                    IconButton(
                      color: Colors.black87,
                      icon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.black38,
                      ),
                      onPressed: () {
                        onSearchPressed("");
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 72.0),
        ));
    return widget;
  }
}
