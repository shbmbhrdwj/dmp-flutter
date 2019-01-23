import 'package:dmp_flutter/models/category.dart';
import 'package:flutter/material.dart';
import 'package:dmp_flutter/utils/icons.dart';

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
                    getIconData(category.icon, category.iconStyle),
                    color:
                        Color(getHexForIconCode(category.icon)).withAlpha(255),
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
