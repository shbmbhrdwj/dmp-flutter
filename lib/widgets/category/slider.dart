import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/services/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesSlider extends StatefulWidget {
  _CategoriesSliderState createState() => _CategoriesSliderState();
}

class _CategoriesSliderState extends State<CategoriesSlider> {
  BuiltList<Category> categories = new BuiltList<Category>();
  static const double CARD_SIZE = 120;
  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: CARD_SIZE,
        child: ListView.builder(
          itemBuilder: listItemBuilder,
          itemCount: categories.length + 1,
          scrollDirection: Axis.horizontal,
        ));
  }

  void getCategories() async {
    var categoriesList = await CategoryService.getAll();
    setState(() {
      this.categories = categoriesList;
    });
  }

  Widget listItemBuilder(BuildContext context, int index) {
    if (index == 0)
      return Container(width: 32, height: CARD_SIZE);
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
