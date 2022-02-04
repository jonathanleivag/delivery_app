import 'package:delivery_app/models/models.dart' show AddressResponseModel;
import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart' show NotificationUtil;
import 'package:delivery_app/views/views.dart' show ClientDirectionListView;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        CircularProgressIndicator,
        Colors,
        Container,
        EdgeInsets,
        ElevatedButton,
        Key,
        MainAxisAlignment,
        Navigator,
        RoundedRectangleBorder,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;
import 'package:rflutter_alert/rflutter_alert.dart'
    show Alert, AlertStyle, DialogButton;

class ClientDirecitionButtonCreateAddressWidget extends StatelessWidget {
  const ClientDirecitionButtonCreateAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    Future<void> _createAddress() async {
      _shoppProvider.setPlacemarks();
      final AddressResponseModel data = await _shoppProvider.createAddress();
      NotificationUtil.showSnackBar(data.message!, success: data.success);
      Navigator.of(context).pushNamedAndRemoveUntil(
        ClientDirectionListView.routerName,
        (route) => false,
      );
    }

    void _alert() {
      Alert(
        context: context,
        title: "Crear dirección",
        desc: "Si quieres editar tus datos cancela el registro con la X",
        style: const AlertStyle(
          descStyle: TextStyle(fontSize: 14),
          descTextAlign: TextAlign.start,
        ),
        buttons: [
          DialogButton(
            child: const Text(
              "Crear dirección",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              Navigator.pop(context);
              _createAddress();
            },
            color: ColorTheme.primaryColor,
            radius: BorderRadius.circular(50),
          ),
        ],
      ).show();
    }

    Future<void> _onPressed() async {
      if (_shoppProvider.placemarksCopy['latitude'] != null &&
          _shoppProvider.placemarksCopy['longitude'] != null) {
        _alert();
      } else {
        NotificationUtil.showSnackBar(
          'Falta una referencia',
          success: false,
        );
      }
    }

    return Container(
      height: 50,
      margin: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: !_shoppProvider.isLoading ? _onPressed : null,
        child: _shoppProvider.isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ColorTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Cargando',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            : const Text(
                'Crear dirección',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
        style: ElevatedButton.styleFrom(
          primary: ColorTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
