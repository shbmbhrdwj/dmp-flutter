import 'package:dmp_flutter/actions/action.dart';
import 'package:dmp_flutter/components/flat_button_with_right_icon.dart';
import 'package:dmp_flutter/components/padded_text.dart';
import 'package:dmp_flutter/components/search_app_bar.dart';
import 'package:dmp_flutter/navigation/routes.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:dmp_flutter/states/customer_home_state.dart';
import 'package:dmp_flutter/widgets/category/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double SCREEN_EDGE_MARGIN = 32;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CustomerHomeState>(
      onInit: (store) {
        store.dispatch(fetchCategories);
      },
      converter: (store) => store.state.customerHomeState,
      builder: (context, viewModel) {
        return Scaffold(
          appBar: SearchAppBar.build(context, "Home", onSearchPressed),
          body: Container(
              child: ListView(
            children: <Widget>[
              getSectionHeader(context, "Categories", () {
                Routes.router.navigateTo(context, Routes.categories);
              }),
              CategoriesSlider(
                categories: viewModel.categoryList,
              ),
              getSectionHeader(context, "Tasks", () {}),
            ],
          )),
        );
      },
    );
  }

  Widget getSectionHeader(
      BuildContext context, String title, Function onPressed) {
    return Row(
      children: <Widget>[
        Expanded(
          child: getSubhead(context, title),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 16, 16),
          child: FlatButtonWithRightIcon(
            text: "View All",
            icon: FontAwesomeIcons.chevronRight,
            onPressed: onPressed,
          ),
        )
      ],
    );
  }

  PaddedText getSubhead(BuildContext context, String title) {
    return PaddedText(
        padding:
            EdgeInsets.fromLTRB(SCREEN_EDGE_MARGIN, SCREEN_EDGE_MARGIN, 0, 16),
        text: title,
        style: Theme.of(context).primaryTextTheme.subhead);
  }

  void onSearchPressed(String query) {
    //TODO: Handle search query
  }
}
