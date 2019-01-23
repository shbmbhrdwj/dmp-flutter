import 'package:dmp_flutter/models/provider.dart';
import 'package:dmp_flutter/navigation/routes.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:dmp_flutter/states/loading_state.dart';
import 'package:dmp_flutter/states/provider_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:dmp_flutter/actions/action.dart';

class ProviderList extends StatelessWidget {
  final String categoryId;
  ProviderList({@required this.categoryId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Providers"),
      ),
      body: StoreConnector<AppState, ProviderListState>(
          onInit: (store) {
            store.dispatch(fetchProvidersForCategory(categoryId));
          },
          builder: (context, viewmodel) {
            if (viewmodel.loadingState == LoadingState.LOADING) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              child: ListView.builder(
                itemBuilder: (context, position) => providerListBuilder(
                    context, viewmodel.providerList[position]),
                itemCount: viewmodel.providerList.length,
              ),
            );
          },
          converter: (store) => store.state.categoryState.providerListState),
    );
  }

  Widget providerListBuilder(BuildContext context, Provider provider) {
    return ListTile(
      title: Text(provider.name),
      onTap: () {
        String path = Routes.getRoute(
            Routes.providerProfile, {"providerId": provider.id.toString()});
        Routes.router.navigateTo(context, path);
      },
    );
  }
}
