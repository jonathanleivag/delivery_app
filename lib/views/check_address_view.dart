import 'package:after_layout/after_layout.dart' show AfterLayoutMixin;
import 'package:delivery_app/models/models.dart' show DataAddress;
import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/views/views.dart'
    show ClientCreateDirectionListView, ClientDirectionListView;
import 'package:delivery_app/widgets/widgets.dart' show Progress;
import 'package:flutter/material.dart'
    show
        AsyncSnapshot,
        BuildContext,
        FutureBuilder,
        Key,
        State,
        StatefulWidget,
        Widget;
import 'package:provider/provider.dart' show Provider;

class CheckAddressView extends StatefulWidget {
  const CheckAddressView({Key? key}) : super(key: key);
  static const String routerName = '/check-address';

  @override
  State<CheckAddressView> createState() => _CheckAddressViewState();
}

class _CheckAddressViewState extends State<CheckAddressView>
    with AfterLayoutMixin<CheckAddressView> {
  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    return FutureBuilder(
      future: _shoppProvider.getAddress(),
      builder: (context, AsyncSnapshot<List<DataAddress>> snapshot) {
        Widget data = const Progress();

        if (!snapshot.hasData) data = const Progress();

        if (snapshot.data != null) {
          final resutl = snapshot.data!;
          if (resutl.isNotEmpty) {
            data = const ClientDirectionListView();
          } else {
            data = const ClientCreateDirectionListView();
          }
        }

        return data;
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    _shoppProvider.resetPlacemarksAll();
  }
}
