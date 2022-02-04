import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/validators/validators.dart'
    show InputAddressValidator;
import 'package:delivery_app/views/views.dart' show ClientDirectionMapView;
import 'package:delivery_app/widgets/widgets.dart'
    show ClientDirectionInputWidget;
import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BuildContext,
        Column,
        Form,
        Icons,
        Key,
        StatelessWidget,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientDirectionFormWidget extends StatelessWidget {
  const ClientDirectionFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    return Form(
        key: _shoppProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            ClientDirectionInputWidget(
              icon: Icons.location_on,
              labelText: 'Dirección',
              name: 'directionForm',
              validator: InputAddressValidator.directionFromValidator,
            ),
            ClientDirectionInputWidget(
              icon: Icons.location_city,
              validator: InputAddressValidator.barrioFromValidator,
              labelText: 'Barrio',
              name: 'barrioForm',
            ),
            ClientDirectionInputWidget(
              icon: Icons.map,
              labelText: _shoppProvider.placemarks['address'] != null
                  ? _shoppProvider.placemarks['address']!
                  : 'Punto de referencia',
              autoFocus: false,
              disabled: true,
              onTap: true,
              routerName: ClientDirectionMapView.routerName,
            ),
          ],
        ));
  }
}
