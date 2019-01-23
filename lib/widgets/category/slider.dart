import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/utils/icons.dart';
import 'package:flutter/material.dart';

class CategoriesSlider extends StatelessWidget {
  final BuiltList<Category> categories;
  static const double CARD_SIZE = 120;

  final void Function(Category category) onItemClicked;

  CategoriesSlider({@required this.categories, this.onItemClicked});

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
    Category category = categories[index - 1];
    Color categoryColor =
        Color(getHexForIconCode(category.icon)).withAlpha(255);
    IconData iconData = getIconData(category.icon, category.iconStyle);
    List<Color> colors = [
      Color.fromARGB(60, 0, 0, 0),
      Color.fromARGB(150, 0, 0, 0)
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: CARD_SIZE,
        height: CARD_SIZE,
        child: Card(
          color: categoryColor,
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: IconButton(
              icon: Icon(
                iconData,
                size: 48,
                color: Colors.white,
              ),
              onPressed: () => onItemClicked(category),
            ),
          ),
        ),
      ),
    );
  }
}
