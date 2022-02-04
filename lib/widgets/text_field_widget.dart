import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Container,
        Icon,
        IconData,
        InputBorder,
        InputDecoration,
        Key,
        StatelessWidget,
        TextEditingController,
        TextFormField,
        TextInputType,
        TextStyle,
        Widget;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:money_input_formatter/money_input_formatter.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final String? labelText;
  final TextEditingController? controller;
  final Function(String)? validator;
  final String? validatorConfirmPassword;
  final String? initialValue;
  final dynamic provider;
  final String? name;
  final int? maxlines;
  final int? maxLength;
  final List<MaskTextInputFormatter>? inputFormatters;
  final List<MoneyInputFormatter>? inputFormatters0;

  const TextFieldWidget({
    Key? key,
    this.hintText,
    this.icon,
    this.keyboardType,
    this.isPassword,
    this.labelText,
    this.controller,
    this.validator,
    this.validatorConfirmPassword,
    this.initialValue,
    this.provider,
    this.name,
    this.maxlines,
    this.maxLength,
    this.inputFormatters,
    this.inputFormatters0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorTheme.primaryOpacityColor,
      ),
      child: TextFormField(
        obscureText: isPassword ?? false,
        enableSuggestions: isPassword == null ? true : false,
        maxLines: maxlines ?? 1,
        maxLength: maxLength,
        onChanged: (value) {
          if (provider != null && name != null) {
            provider.formData[name] = value;
          }
        },
        initialValue: initialValue,
        validator: (value) {
          if (validator != null && value != null) {
            return validator!(value);
          }

          if (validatorConfirmPassword != null && value != null) {
            return validatorConfirmPassword;
          }
        },
        autocorrect: isPassword == null ? true : false,
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputFormatters ?? inputFormatters0 ?? [],
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText ?? '',
          labelText: labelText ?? '',
          labelStyle: _textStyle(),
          hintStyle: _textStyle(),
          prefixIcon: Icon(icon, color: ColorTheme.primaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      color: ColorTheme.primaryColorDark,
    );
  }
}
