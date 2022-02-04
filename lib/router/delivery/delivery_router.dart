import 'package:delivery_app/views/views.dart' show DeliveryOrderView;
import 'package:flutter/material.dart' show BuildContext, Widget, WidgetBuilder;

Map<String, Widget Function(BuildContext)> deliveryRouter =
    <String, WidgetBuilder>{
  DeliveryOrderView.routerName: (BuildContext context) => const DeliveryOrderView(),
};
