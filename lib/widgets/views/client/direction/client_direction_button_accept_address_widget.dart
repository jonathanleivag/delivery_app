import 'package:delivery_app/models/models.dart' show AddressResponseModel;
import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart' show NotificationUtil;
import 'package:delivery_app/views/views.dart';
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
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientDirecitionButtonAcceptAddressWidget extends StatelessWidget {
  const ClientDirecitionButtonAcceptAddressWidget({
    Key? key,
    required this.text,
    this.map,
  }) : super(key: key);

  final String text;
  final bool? map;

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    Future<void> _onPressed() async {
      if (map != null) {
        final AddressResponseModel data =
            await _shoppProvider.addAddressShopp();
        NotificationUtil.showSnackBar(data.message!, success: data.success);
        if (data.success) {
          Navigator.of(context).pushNamed(ClientPayCardView.routerName);
        }
      } else {
        _shoppProvider.setPlacemarks();
        Navigator.of(context).pop();
      }
    }

    return Container(
      height: 50,
      margin: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: _shoppProvider.isLoading ? null : _onPressed,
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
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Cargando...'),
                ],
              )
            : Text(
                text,
                style: const TextStyle(
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
