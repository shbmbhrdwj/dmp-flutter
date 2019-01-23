import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/components/padded_text.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/actions/action.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:dmp_flutter/states/category_state.dart';
import 'package:dmp_flutter/widgets/category/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoryState>(
      onInit: (store) => store.dispatch(fetchCategories),
      converter: (store) => store.state.categoryState,
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: Container(
              color: Color.fromARGB(255, 240, 238, 244),
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    getListViewItem(context, index, viewModel.categoryList),
                itemCount: viewModel.categoryList.length + 1,
              )),
        );
      },
    );
  }

  Widget getListViewItem(
      BuildContext context, int index, BuiltList<Category> categories) {
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
}
