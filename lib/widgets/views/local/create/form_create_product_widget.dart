import 'package:delivery_app/providers/providers.dart' show ProductProvider;
import 'package:delivery_app/validators/validators.dart';
import 'package:delivery_app/widgets/widgets.dart' show TextFieldWidget;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        Form,
        Icons,
        Key,
        SizedBox,
        StatelessWidget,
        TextInputType,
        AutovalidateMode,
        Widget;
import 'package:money_input_formatter/money_input_formatter.dart'
    show MoneyInputFormatter;
import 'package:provider/provider.dart' show Provider;

class FormLocalCreateProductWidget extends StatelessWidget {
  const FormLocalCreateProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedBox _space() => const SizedBox(height: 10);
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);

    return Form(
      key: _productProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          _space(),
          TextFieldWidget(
            hintText: 'Pizza familiar',
            maxLength: 180,
            provider: _productProvider,
            maxlines: 1,
            icon: Icons.local_pizza,
            validator: InputProductValidator.name,
            name: 'name',
            labelText: 'Producto',
          ),
          _space(),
          TextFieldWidget(
            hintText: 'Descripción',
            icon: Icons.description,
            provider: _productProvider,
            validator: InputProductValidator.description,
            maxLength: 140,
            maxlines: 3,
            name: 'description',
            labelText: 'Descripción del producto',
          ),
          _space(),
          TextFieldWidget(
            hintText: '2000',
            icon: Icons.monetization_on,
            keyboardType: TextInputType.number,
            maxlines: 1,
            name: 'price',
            validator: InputProductValidator.price,
            provider: _productProvider,
            inputFormatters0: [MoneyInputFormatter()],
            labelText: 'price',
          ),
        ],
      ),
    );
  }
}
