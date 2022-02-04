import 'package:delivery_app/providers/providers.dart';
import 'package:delivery_app/theme/color_theme.dart';
import 'package:delivery_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientDirectionMapView extends StatelessWidget {
  const ClientDirectionMapView({Key? key}) : super(key: key);
  static const String routerName = '/client/direction-map';

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubica tu dirección en el mapa'),
        backgroundColor: ColorTheme.primaryColor,
      ),
      body: Stack(
        children: <Widget>[
          const ClientDirectionMapWidget(),
          if (_shoppProvider.placemarksCopy['direction'] != null)
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 30),
              child: const ClientDirectionNameWidget(),
            ),
        ],
      ),
      bottomNavigationBar: const ClientDirecitionButtonAcceptAddressWidget(
        text: 'Selecciona este punto',
      ),
    );
  }
}
