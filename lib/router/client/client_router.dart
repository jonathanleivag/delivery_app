import 'package:delivery_app/views/views.dart'
    show
        CheckAddressView,
        CheckInstallments,
        ClientCreateDirectionListView,
        ClientDirectionListView,
        ClientDirectionMapView,
        ClientOrderListView,
        ClientOrderSummaryView,
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
  CheckInstallments.routerName: (BuildContext context) {
    return const CheckInstallments();
  },
  ClientOrderSummaryView.routerName: (BuildContext context) {
    return const ClientOrderSummaryView();
  },
  ClientOrderSummaryView.routerNameError: (BuildContext context) {
    return const ClientOrderSummaryView(
      isError: true,
    );
  },
};
