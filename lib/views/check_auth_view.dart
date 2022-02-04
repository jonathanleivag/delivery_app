import 'package:delivery_app/models/models.dart' show RoleResponseModel;
import 'package:delivery_app/providers/providers.dart' show LoginProvider;
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/views/views.dart'
    show ClientProductListView, LoginView, SelectedRoleView;
import 'package:flutter/material.dart'
    show
        AsyncSnapshot,
        BuildContext,
        Center,
        FutureBuilder,
        Key,
        Navigator,
        PageRouteBuilder,
        Scaffold,
        StatelessWidget,
        Widget;
import 'package:provider/provider.dart' show ChangeNotifierProvider, Provider;
import 'package:delivery_app/widgets/widgets.dart' show Progress;

class CheckAuthView extends StatelessWidget {
  static String routerName = "/check/auth";

  const CheckAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      child: const Scaffold(
        body: _CheckAuth(),
      ),
    );
  }
}

class _CheckAuth extends StatelessWidget {
  const _CheckAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginProvider _loginProvider = Provider.of<LoginProvider>(context);

    return Center(
      child: FutureBuilder(
        future: _loginProvider.readToken(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          Widget data = const Progress();

          if (!snapshot.hasData) {
            data = const Progress();
          }

          Future.microtask(() => {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    Widget data = const Progress();
                    if (snapshot.data != null) {
                      if (snapshot.data == '') {
                        data = const LoginView();
                      } else {
                        data = _RoleUser(
                          loginProvider: _loginProvider,
                          token: snapshot.data!,
                        );
                      }
                    }

                    return data;
                  },
                ))
              });

          return data;
        },
      ),
    );
  }
}

class _RoleUser extends StatelessWidget {
  const _RoleUser({
    Key? key,
    required LoginProvider loginProvider,
    required this.token,
  })  : _loginProvider = loginProvider,
        super(key: key);

  final LoginProvider _loginProvider;
  final String token;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loginProvider.getRoleUser(token: token),
      builder:
          (BuildContext context, AsyncSnapshot<RoleResponseModel> snapshot) {
        Widget data = const Progress();

        if (!snapshot.hasData) {
          data = const Progress();
        }

        if (snapshot.data != null) {
          Future.microtask(
            () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  Widget data = const Progress();
                  if (snapshot.data?.data!.length == 1) {
                    data = const ClientProductListView();
                    SecureStorageUtil.set('isrole', 'false');
                  } else {
                    data = SelectedRoleView(roleResponseModel: snapshot.data!);
                    SecureStorageUtil.set('isrole', 'true');
                  }
                  return data;
                },
              ),
            ),
          );
        }

        return data;
      },
    );
  }
}
