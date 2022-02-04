import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Colors,
        Icon,
        IconButton,
        Icons,
        Key,
        Navigator,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;
import 'package:rflutter_alert/rflutter_alert.dart'
    show Alert, AlertStyle, DialogButton;

class ClientOrderButtonDeleteListWidget extends StatelessWidget {
  const ClientOrderButtonDeleteListWidget({
    Key? key,
    required this.index,
    required this.idProduct,
  }) : super(key: key);

  final int index;
  final String idProduct;

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    void _onPressed() {
      Alert(
        context: context,
        title: "Quitar el producto de la bolsa",
        desc: "Si quieres editar tus datos cancela el registro con la X",
        style: const AlertStyle(
          descStyle: TextStyle(fontSize: 14),
          descTextAlign: TextAlign.start,
        ),
        buttons: [
          DialogButton(
            child: const Text(
              "Quitar el producto",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              Navigator.pop(context);
              final data = await _shoppProvider.deleteProduct(
                index: index,
                idProduct: idProduct,
              );
              NotificationUtil.showSnackBar(
                data.message!,
                success: data.success,
              );
            },
            color: ColorTheme.primaryColor,
            radius: BorderRadius.circular(50),
          ),
        ],
      ).show();
    }

    return IconButton(
      onPressed: _onPressed,
      icon: Icon(
        Icons.delete,
        color: ColorTheme.primaryColor,
      ),
    );
  }
}
