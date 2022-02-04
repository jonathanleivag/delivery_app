import 'package:delivery_app/views/views.dart'
    show
        CheckAddressView,
        ClientCreateDirectionListView,
        ClientDirectionListView,
        ClientDirectionMapView,
        ClientOrderListView,
        ClientPayCardView,
        ClientProductListView;
import 'package:flutter/material.dart' show BuildContext, Widget, WidgetBuilder;

Map<String, Widget Function(BuildContext)> clientRouter =
    <String, WidgetBuilder>{
  ClientProductListView.routerName: (BuildContext context) {
    return const ClientProductListView();
  },
  ClientOrderListView.routerName: (BuildContext context) {
    return const ClientOrderListView();
  },
  ClientDirectionListView.routerName: (BuildContext context) {
    return const ClientDirectionListView();
  },
  ClientCreateDirectionListView.routerName: (BuildContext context) {
    return const ClientCreateDirectionListView();
  },
  ClientDirectionMapView.routerName: (BuildContext context) {
    return const ClientDirectionMapView();
  },
  CheckAddressView.routerName: (BuildContext context) {
    return const CheckAddressView();
  },
  ClientPayCardView.routerName: (BuildContext context) {
    return const ClientPayCardView();
  },
};
