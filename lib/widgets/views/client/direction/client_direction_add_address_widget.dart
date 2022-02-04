import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/views/views.dart'
    show ClientCreateDirectionListView;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Icon,
        IconButton,
        Icons,
        Key,
        Navigator,
        StatelessWidget,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientDirectionAddAddressWidget extends StatelessWidget {
  const ClientDirectionAddAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    return IconButton(
      onPressed: () {
        _shoppProvider.resetPlacemarksAll();
        Navigator.pushNamed(
          context,
          ClientCreateDirectionListView.routerName,
        );
      },
      icon: const Icon(
        Icons.add_location,
      ),
    );
  }
}
