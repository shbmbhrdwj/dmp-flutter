import 'package:dmp_flutter/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;

  CategoryListItem({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Material(
              color: Colors.white,
              child: InkWell(
                child: ListTile(
                  title: Text(category.name),
                  subtitle: Text("All your plumbing needs"),
                  leading: Icon(
                    FontAwesomeIcons.broom,
                    color: Colors.blue,
                    size: 32.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 80.0),
              child: Divider(
                height: 1.0,
              ),
            )
          ],
        ));
  }
}
