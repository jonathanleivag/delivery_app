import 'package:delivery_app/providers/providers.dart' show CreditCardProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart' show NotificationUtil;
import 'package:delivery_app/views/views.dart' show CheckInstallments;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
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

class ClientCreditCardButtonWidget extends StatelessWidget {
  const ClientCreditCardButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreditCardProvider _creditCardProvider =
        Provider.of<CreditCardProvider>(context);

    Future<void> _setCard() async {
      try {
        if (_creditCardProvider.cardNumber == '' ||
            _creditCardProvider.cardNumber.length < 15) {
          throw ('El número de la tarjeta no es válido');
        }

        final expiryDate = _creditCardProvider.expiryDate;
        final int month = int.parse(expiryDate.split('/')[0]);
        final int year = int.parse(expiryDate.split('/')[1]);
        final DateTime now = DateTime.now();
        final List yearNowArray = now.year.toString().split('');
        final int yearNow = int.parse(yearNowArray[yearNowArray.length - 2] +
            yearNowArray[yearNowArray.length - 1]);
        if (_creditCardProvider.expiryDate == '' ||
            _creditCardProvider.expiryDate.length < 5 ||
            month < 1 ||
            month > 12 ||
            year < yearNow) {
          throw ('La fecha de expiración no es válida');
        }

        if (_creditCardProvider.expiryDate == '' ||
            _creditCardProvider.expiryDate.length < 5) {
          throw ('El código de seguridad no es válido');
        }

        if (_creditCardProvider.cvvCode == '' ||
            _creditCardProvider.cvvCode.length < 3) {
          throw ('El código de seguridad no es válido');
        }

        if (_creditCardProvider.cardHolderName == '') {
          throw ('El nombre del titular no es válido');
        }
        await _creditCardProvider.cardTokens();
        Navigator.of(context).pushNamed(CheckInstallments.routerName);
      } catch (e) {
        NotificationUtil.showSnackBar(e.toString(), success: false);
      }
    }

    return Container(
      height: 50,
      margin: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: _setCard,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.arrow_forward_ios),
            SizedBox(width: 10),
            Text(
              'Continuar',
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
