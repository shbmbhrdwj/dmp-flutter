import 'package:dmp_flutter/components/padded_text.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/services/category.dart';
import 'package:dmp_flutter/widgets/category/list_item.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  void initState() {
    super.initState();
    getCategories();
  }

  List<Category> categories = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
          color: Color.fromARGB(255, 240, 238, 244),
          child: ListView.builder(
            itemBuilder: getListViewItem,
            itemCount: categories.length,
          )),
    );
  }

  void onItemClicked() {
    ///TODO Show Service Form
  }

  Widget getListViewItem(BuildContext context, int index) {
    if (index == 0) {
      return PaddedText(
          text: "Categories",
          padding: EdgeInsets.all(16.0),
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontSize: 16.0));
    }
    return CategoryListItem(category: categories[index - 1]);
  }

  void getCategories() async {
    var categoriesList = await CategoryService.getAll();
    setState(() {
      this.categories = categoriesList;
    });
  }
}
