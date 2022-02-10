import 'package:delivery_app/models/models.dart' show DataAddress;
import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/views/views.dart' show ClientOrderListView;
import 'package:delivery_app/widgets/widgets.dart'
    show
        ClientDirecitionButtonAcceptAddressWidget,
        ClientDirectionAddAddressWidget,
        ClientDirectionTitleAddressWidget,
        ClientListDirectionRadioWidget,
        NoItemWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        AsyncSnapshot,
        BuildContext,
        Column,
        FutureBuilder,
        Icon,
        IconButton,
        Icons,
        Key,
        Navigator,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientDirectionListView extends StatelessWidget {
  const ClientDirectionListView({Key? key}) : super(key: key);

  static const String routerName = '/client/direction';

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus direcciones'),
        backgroundColor: ColorTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pushNamed(ClientOrderListView.routerName);
          },
        ),
        actions: const [
          ClientDirectionAddAddressWidget(),
        ],
      ),
      body: Column(
        children: [
          const ClientDirectionTitleAddressWidget(
            title: 'Elige donde deseas recibir tu pedido',
          ),
          FutureBuilder(
            future: _shoppProvider.getAddress(),
            builder: (context, AsyncSnapshot<List<DataAddress>> snapshot) {
              Widget data = const NoItemWidget(text: 'No hay dirección');

              if (!snapshot.hasData) {
                data = const NoItemWidget(text: 'No hay dirección');
              }

              if (snapshot.data != null) {
                final List<DataAddress> addresses = snapshot.data!;

                if (addresses.isNotEmpty) {
                  data = ClientListDirectionRadioWidget(directions: addresses);
                } else {
                  data = const NoItemWidget(text: 'No hay dirección');
                }
              }
              return data;
            },
          )
        ],
      ),
      bottomNavigationBar: const ClientDirecitionButtonAcceptAddressWidget(
        text: 'Aceptar',
        map: true,
      ),
    );
  }
}
