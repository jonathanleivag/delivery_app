import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        BorderSide,
        BuildContext,
        Container,
        EdgeInsets,
        FocusNode,
        Icon,
        IconData,
        InputDecoration,
        Key,
        Navigator,
        StatelessWidget,
        TextFormField,
        TextStyle,
        UnderlineInputBorder,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientDirectionInputWidget extends StatelessWidget {
  const ClientDirectionInputWidget({
    Key? key,
    required this.icon,
    required this.labelText,
    this.disabled,
    this.autoFocus = true,
    this.onTap,
    this.routerName,
    this.name,
    this.validator,
  }) : super(key: key);

  final IconData icon;
  final String labelText;
  final bool? disabled;
  final bool autoFocus;
  final bool? onTap;
  final String? routerName;
  final String? name;
  final Function(String)? validator;

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    void _onChanged(String value) {
      _shoppProvider.setForm(name!, value);
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: TextFormField(
        autofocus: autoFocus,
        initialValue: name != null ? _shoppProvider.placemarksCopy[name!] : '',
        validator: (value) {
          if (validator != null && value != null) {
            return validator!(value);
          }
        },
        onTap: onTap != null
            ? () => Navigator.of(context).pushNamed(routerName!)
            : null,
        focusNode: disabled != null ? DisabledTextInput() : null,
        onChanged: name != null ? _onChanged : null,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: ColorTheme.primaryColor,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorTheme.primaryColor,
            ),
          ),
          suffixIcon: Icon(
            icon,
            color: ColorTheme.primaryColor,
          ),
        ),
      ),
    );
  }
}

class DisabledTextInput extends FocusNode {
  @override
  bool get hasFocus => false;
}
