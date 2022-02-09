import 'package:delivery_app/models/models.dart'
    show DataInstallments, InstallmentsResponeseModel;
import 'package:delivery_app/providers/providers.dart'
    show CreditCardProvider, ShoppProvider;
import 'package:delivery_app/views/views.dart'
    show ClietPaymentsInstallmentsView;
import 'package:delivery_app/widgets/widgets.dart' show Progress;
import 'package:flutter/material.dart'
    show
        AsyncSnapshot,
        BuildContext,
        FutureBuilder,
        Key,
        StatelessWidget,
        Widget;
import 'package:provider/provider.dart' show Provider;

class CheckInstallments extends StatelessWidget {
  const CheckInstallments({Key? key}) : super(key: key);

  static const String routerName = '/check-installments';

  @override
  Widget build(BuildContext context) {
    final CreditCardProvider _creditCardProvider =
        Provider.of<CreditCardProvider>(context);
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    final int total = _shoppProvider.totalOrder;

    return FutureBuilder(
      future: _creditCardProvider.installments(amount: total),
      builder: (context, AsyncSnapshot<InstallmentsResponeseModel> snapshot) {
        Widget data = const Progress();
        if (!snapshot.hasData) data = const Progress();

        if (snapshot.data != null) {
          final DataInstallments dataInstallments = snapshot.data!.data!;
          data = ClietPaymentsInstallmentsView(
            dataInstallments: dataInstallments,
          );
        }

        return data;
      },
    );
  }
}
