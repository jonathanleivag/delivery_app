import 'package:cool_dropdown/cool_dropdown.dart' show CoolDropdown;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart' show Alignment, BorderRadius, BoxDecoration, BuildContext, Colors, Container, EdgeInsets, Key, MediaQuery, Padding, StatelessWidget, TextStyle, Widget;

class ClientDropdownInstallmentsWidget extends StatelessWidget {
  const ClientDropdownInstallmentsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List dropdownItemList = [
      {'label': 'apple', 'value': 'apple'}, // label is required and unique
      {'label': 'banana', 'value': 'banana'},
      {'label': 'grape', 'value': 'grape'},
      {'label': 'pineapple', 'value': 'pineapple'},
      {'label': 'grape fruit', 'value': 'grape fruit'},
      {'label': 'kiwi', 'value': 'kiwi'},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.2,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorTheme.primaryOpacityColor,
        ),
        child: CoolDropdown(
            dropdownList: dropdownItemList,
            onChange: (_) {},
            defaultValue: dropdownItemList[3],
            placeholderTS: TextStyle(
              color: ColorTheme.primaryColor,
              fontSize: 20,
            ),
            selectedItemTS: const TextStyle(color: Colors.white, fontSize: 20),
            selectedItemBD: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorTheme.primaryColor,
            ),
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
            )),
      ),
    );
  }
}
