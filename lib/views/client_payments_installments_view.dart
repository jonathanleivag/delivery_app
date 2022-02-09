import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/widgets/widgets.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Column,
        Key,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;

class ClietPaymentsInstallmentsView extends StatelessWidget {
  const ClietPaymentsInstallmentsView(
      {Key? key, required this.dataInstallments})
      : super(key: key);

  static const String routerName = '/client/payments/installments';
  final DataInstallments dataInstallments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuotas'),
        backgroundColor: ColorTheme.primaryColor,
      ),
      body: Column(
        children: [
          const ClientTextInstallmentsWidget(),
          ClientDropdownInstallmentsWidget(
            payCost: dataInstallments.payerCosts!,
          ),
        ],
      ),
      bottomSheet: const ClientOrderTotalListWidget(),
      bottomNavigationBar: const ClientButtonInstallmentsWidget(),
    );
  }
}
