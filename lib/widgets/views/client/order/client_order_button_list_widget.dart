import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/views/views.dart' show CheckAddressView;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        ElevatedButton,
        FontWeight,
        Icon,
        Icons,
        Key,
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

class ClientOrderButtonListWidget extends StatelessWidget {
  const ClientOrderButtonListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    final bool isUpdateOrder = _shoppProvider.isUpdateOrder;

    Future<void> _onPressed() async {
      if (isUpdateOrder) {
        await _shoppProvider.updateProductAll();
      }

      Navigator.of(context).pushNamed(CheckAddressView.routerName);
    }

    return Container(
      margin: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: _onPressed,
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
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              isUpdateOrder ? 'Actualizar y Continuar' : 'Continuar',
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
