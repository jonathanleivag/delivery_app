import 'package:cool_dropdown/cool_dropdown.dart' show CoolDropdown;
import 'package:delivery_app/helpers/dropdown_item_list.dart'
    show DropdownItemList;
import 'package:delivery_app/models/models.dart' show PayerCost;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        Alignment,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        Key,
        MediaQuery,
        Padding,
        StatelessWidget,
        TextStyle,
        Widget;

class ClientDropdownInstallmentsWidget extends StatelessWidget {
  const ClientDropdownInstallmentsWidget({
    Key? key,
    required this.payCost,
  }) : super(key: key);

  final List<PayerCost> payCost;

  @override
  Widget build(BuildContext context) {
    final cost = DropdownItemList(payerCosts: payCost).listCost();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorTheme.primaryOpacityColor,
        ),
        child: CoolDropdown(
          dropdownList: cost,
          resultWidth: MediaQuery.of(context).size.width,
          dropdownWidth: MediaQuery.of(context).size.width * 0.75,
          onChange: (_) {},
          placeholder: 'No hay cuotas',
          placeholderTS: TextStyle(
            color: ColorTheme.primaryColor,
            fontSize: 20,
          ),
          selectedItemTS: const TextStyle(color: Colors.white, fontSize: 20),
          selectedItemBD: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorTheme.primaryColor,
          ),
          defaultValue: cost[0],
          resultAlign: Alignment.center,
          resultBD: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent,
          ),
          resultTS: TextStyle(color: ColorTheme.primaryColor, fontSize: 20),
          resultPadding: const EdgeInsets.symmetric(horizontal: 25),
          dropdownBD: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
