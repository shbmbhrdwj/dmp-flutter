import 'dart:convert';

import 'package:dmp_flutter/components/category_list_item.dart';
import 'package:dmp_flutter/components/padded_text.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState() {
    getCategories();
  }

  List<Category> categories = List();

  Future<List<Category>> getCategories() async {
    var url = "http://dmp.faimtech.in/api/categories";
    final response = await http.get(url);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var responseJson = json.decode(response.body);
      var categories = (responseJson['data'] as List)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();

      setState(() {
        this.categories = categories;
      });

      return categories;
    }

    return List();
  }

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
    print("Hello");
  }

  Widget getListViewItem(BuildContext context, int index) {
    if (index == 0) {
      var paddedText =
          PaddedText(text: "Categories", padding: EdgeInsets.all(16.0));
      paddedText.style = TextStyle(
          color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 16.0);
      return paddedText;
    }
    return CategoryListItem(category: categories[index - 1]);
  }
}
