import 'package:delivery_app/models/role_response_model.dart';
import 'package:delivery_app/providers/providers.dart' show LoginProvider;
import 'package:flutter/material.dart'
    show
        AsyncSnapshot,
        BuildContext,
        Center,
        FutureBuilder,
        Key,
        SizedBox,
        StatelessWidget,
        Widget;
import 'package:provider/provider.dart' show ChangeNotifierProvider, Provider;
import 'package:delivery_app/widgets/widgets.dart' show Progress;
import 'package:delivery_app/views/views.dart'
    show ClientProductListView, DeliveryOrderView, LocalOrderListView, RoleView;

class SelectedRoleView extends StatelessWidget {
  static String routerName = "/role";

  final RoleResponseModel roleResponseModel;
  const SelectedRoleView({
    Key? key,
    required this.roleResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _SelectedRole(roleResponseModel: roleResponseModel),
      ),
    );
  }
}

class _SelectedRole extends StatelessWidget {
  const _SelectedRole({
    Key? key,
    required this.roleResponseModel,
  }) : super(key: key);
  final RoleResponseModel roleResponseModel;
  @override
  Widget build(BuildContext context) {
    final LoginProvider _loginProvider = Provider.of<LoginProvider>(context);

    return Center(
      child: FutureBuilder(
        future: _loginProvider.readRole(),
        builder: (_, AsyncSnapshot<String> snapshot) {
          Widget data = const Progress();
          if (!snapshot.hasData) {
            return const Progress();
          }

          if (snapshot.data != null) {
            switch (snapshot.data) {
              case '':
                data = RoleView(
                  roleResponseModel: roleResponseModel,
                );
                break;
              case 'client':
                data = const ClientProductListView();
                break;
              case 'delivery':
                data = const DeliveryOrderView();
                break;
              case 'local':
                data = const LocalOrderListView();
                break;
              default:
                data = const Progress();
            }
          }

          return data;
        },
      ),
    );
  }
}
