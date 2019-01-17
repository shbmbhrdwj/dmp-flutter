import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesSlider extends StatelessWidget {
  final BuiltList<Category> categories;
  static const double CARD_SIZE = 120;

  CategoriesSlider({@required this.categories});

  @override
  Widget build(BuildContext context) {
    Widget widgetToRender;
    if (categories == null || categories.length == 0) {
      widgetToRender = Center(
        child: CircularProgressIndicator(),
      );
    } else {
      widgetToRender = ListView.builder(
        itemBuilder: listItemBuilder,
        itemCount: categories.length + 1,
        scrollDirection: Axis.horizontal,
      );
    }
    return Container(height: CARD_SIZE, child: widgetToRender);
  }

  Widget listItemBuilder(BuildContext context, int index) {
    if (index == 0) return Container(width: 32, height: CARD_SIZE);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: CARD_SIZE,
        height: CARD_SIZE,
        child: Card(
          color: Colors.red[300],
          elevation: 8,
          child: IconButton(
            icon: Icon(
              FontAwesomeIcons.broom,
              size: 48,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
