import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart' show NotificationUtil;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        GestureDetector,
        Icon,
        Icons,
        Key,
        Navigator,
        Padding,
        Row,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;
import 'package:rflutter_alert/rflutter_alert.dart'
    show Alert, AlertStyle, DialogButton;

class ClientButtonDeleteProductWidget extends StatelessWidget {
  const ClientButtonDeleteProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    void _onTap() {
      Alert(
        context: context,
        title: "Quitar el producto",
        desc: "Si no quieres quitarlo X",
        style: const AlertStyle(
          descStyle: TextStyle(fontSize: 14),
          descTextAlign: TextAlign.start,
        ),
        buttons: [
          DialogButton(
            child: const Text(
              'Quitar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              final data = await _shoppProvider.deleteProduct();
              Navigator.of(context).pop();
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

    return !_shoppProvider.isLoading
        ? GestureDetector(
            onTap: _onTap,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, right: 3),
                  child: Icon(
                    Icons.remove_circle_outline,
                    size: 16,
                    color: ColorTheme.primaryColor,
                  ),
                ),
                Text(
                  'Quitar',
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorTheme.primaryColor,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
