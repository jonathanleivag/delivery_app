import 'package:delivery_app/models/models.dart' show ShoppResponseModel;
import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart' show NotificationUtil;
import 'package:flutter/material.dart'
    show
        AssetImage,
        BorderRadius,
        BuildContext,
        CircularProgressIndicator,
        Colors,
        Container,
        EdgeInsets,
        ElevatedButton,
        FontWeight,
        Image,
        Key,
        TextAlign,
        MainAxisAlignment,
        Navigator,
        Padding,
        RoundedRectangleBorder,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;
import 'package:rflutter_alert/rflutter_alert.dart'
    show Alert, AlertStyle, DialogButton;

class ClientButtonProductDetailWidget extends StatelessWidget {
  const ClientButtonProductDetailWidget({
    Key? key,
    this.isUpdate,
  }) : super(key: key);

  final bool? isUpdate;

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    Future _onPressed() async {
      try {
        Alert(
          context: context,
          title: isUpdate != null && !isUpdate!
              ? "Agregar a la bolsa"
              : "Actualizar el pedido",
          desc: "Si quieres editar tus datos cancela el registro con la X",
          style: const AlertStyle(
            descStyle: TextStyle(fontSize: 14),
            descTextAlign: TextAlign.start,
          ),
          buttons: [
            DialogButton(
              child: Text(
                isUpdate != null && !isUpdate!
                    ? 'Agregar a la bolsa'
                    : 'Actulizar',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                if (isUpdate != null && !isUpdate!) {
                  final ShoppResponseModel data =
                      await _shoppProvider.addToCart();
                  Navigator.of(context).pop();
                  NotificationUtil.showSnackBar(data.message!,
                      success: data.success);
                } else {
                  final ShoppResponseModel data =
                      await _shoppProvider.updateProduct();
                  Navigator.of(context).pop();
                  NotificationUtil.showSnackBar(data.message!,
                      success: data.success);
                }
              },
              color: ColorTheme.primaryColor,
              radius: BorderRadius.circular(50),
            ),
          ],
        ).show();
      } catch (e) {
        NotificationUtil.showSnackBar(e.toString(), success: false);
      }
    }

    return Container(
      margin: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: _shoppProvider.isLoading ? null : _onPressed,
        style: ElevatedButton.styleFrom(
          primary: ColorTheme.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: _shoppProvider.isLoading
                  ? SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        color: ColorTheme.primaryColor,
                      ),
                    )
                  : const Image(
                      image: AssetImage('assets/img/bag.png'),
                      height: 30,
                    ),
            ),
            const SizedBox(width: 10),
            Text(
              _shoppProvider.isLoading
                  ? 'Cargando...'
                  : isUpdate != null && !isUpdate!
                      ? 'Agregar a la bolsa'
                      : 'Actulizar',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
