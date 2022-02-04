import 'package:delivery_app/models/models.dart'
    show DataRole, RoleResponseModel;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart' show SecureStorageUtil;
import 'package:delivery_app/views/views.dart'
    show ClientProductListView, DeliveryOrderView, LocalOrderListView;
import 'package:delivery_app/widgets/widgets.dart' show IconRole, TextWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Column,
        Container,
        EdgeInsets,
        Icon,
        IconButton,
        Icons,
        Key,
        ListView,
        MediaQuery,
        Navigator,
        Scaffold,
        Size,
        SizedBox,
        StatelessWidget,
        Text,
        GestureDetector,
        Widget;

class RoleView extends StatelessWidget {
  const RoleView({
    Key? key,
    required this.roleResponseModel,
  }) : super(key: key);

  final RoleResponseModel roleResponseModel;

  @override
  Widget build(BuildContext context) {
    List<DataRole> data = roleResponseModel.data!;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccione un rol'),
        backgroundColor: ColorTheme.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              SecureStorageUtil.logout(context);
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.50,
          height: size.height * 0.70,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(top: 10),
                child: _SelectRole(
                  child: Column(
                    children: [
                      IconRole(icon: data[index].role.name),
                      TextWidget(name: data[index].role.name),
                    ],
                  ),
                  route: data[index].role.name,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SelectRole extends StatelessWidget {
  const _SelectRole({
    Key? key,
    required this.child,
    required this.route,
  }) : super(key: key);

  final Widget child;
  final String route;

  @override
  Widget build(BuildContext context) {
    String _routerName() {
      String dataRouter = '';

      switch (route) {
        case 'client':
          dataRouter = ClientProductListView.routerName;
          break;
        case 'delivery':
          dataRouter = DeliveryOrderView.routerName;
          break;
        case 'local':
          dataRouter = LocalOrderListView.routerName;
          break;
        default:
          dataRouter = ClientProductListView.routerName;
      }

      return dataRouter;
    }

    return GestureDetector(
      child: child,
      onTap: () {
        SecureStorageUtil.set('role', route);
        Navigator.pushReplacementNamed(context, _routerName());
      },
    );
  }
}
