import 'package:delivery_app/theme/color_theme.dart';
import 'package:delivery_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClientCreateDirectionListView extends StatelessWidget {
  const ClientCreateDirectionListView({Key? key}) : super(key: key);
  static const String routerName = '/client/create/direction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva dirección'),
        backgroundColor: ColorTheme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ClientDirectionTitleAddressWidget(
              title: 'Completa estos datos',
            ),
            SingleChildScrollView(
              child: ClientDirectionFormWidget(),
            )
          ],
        ),
      ),
      bottomNavigationBar: const ClientDirecitionButtonCreateAddressWidget(),
    );
  }
}
