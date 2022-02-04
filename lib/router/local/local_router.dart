import 'package:delivery_app/views/views.dart'
    show LocalOrderListView, LocalCreateCategoryView, LocalCreateProductView;
import 'package:flutter/material.dart' show BuildContext, Widget, WidgetBuilder;

Map<String, Widget Function(BuildContext)> localRouter =
    <String, WidgetBuilder>{
  LocalOrderListView.routerName: (BuildContext context) =>
      const LocalOrderListView(),
  LocalCreateCategoryView.routerName: (BuildContext context) =>
      const LocalCreateCategoryView(),
  LocalCreateProductView.routerName: (BuildContext context) =>
      const LocalCreateProductView(),
};
