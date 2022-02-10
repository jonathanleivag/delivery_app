import 'package:delivery_app/providers/providers.dart'
    show CreditCardProvider, ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/views/views.dart' show ClientOrderSummaryView;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        CircularProgressIndicator,
        Colors,
        Container,
        EdgeInsets,
        ElevatedButton,
        Icon,
        Icons,
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

class ClientButtonInstallmentsWidget extends StatelessWidget {
  const ClientButtonInstallmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreditCardProvider _creditCardProvider =
        Provider.of<CreditCardProvider>(context);
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    Future<void> _onPressed() async {
      try {
        await _creditCardProvider.paymentCreditCard(
          amount: _shoppProvider.totalOrder,
        );
        _shoppProvider.reset();
        Navigator.of(context).pushNamedAndRemoveUntil(
          ClientOrderSummaryView.routerName,
          (route) => false,
        );
      } catch (e) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          ClientOrderSummaryView.routerNameError,
          (route) => false,
        );
      }
    }

    return Container(
      height: 50,
      margin: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: _creditCardProvider.isLoading ? null : _onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _creditCardProvider.isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ColorTheme.primaryColor,
                    ))
                : const Icon(Icons.attach_money),
            const SizedBox(width: 10),
            const Text(
              'Confirmar pago',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
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
