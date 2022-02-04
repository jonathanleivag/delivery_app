import 'package:delivery_app/providers/providers.dart'
    show
        CategoryProvider,
        CreditCardProvider,
        MenuProvider,
        ProductProvider,
        ProfileProvider,
        RegisterProvider,
        ShoppProvider;
import 'package:delivery_app/router/router.dart' show Routes;
import 'package:delivery_app/theme/theme.dart' show MyThemeTheme;
import 'package:delivery_app/utils/utils.dart' show NotificationUtil;
import 'package:delivery_app/views/views.dart' show CheckAuthView;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Key,
        MaterialApp,
        StatelessWidget,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider;
import 'package:flutter_config/flutter_config.dart' show FlutterConfig;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ShoppProvider()),
        ChangeNotifierProvider(create: (context) => CreditCardProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: NotificationUtil.globalKey,
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: CheckAuthView.routerName,
      routes: Routes().routes,
      theme: MyThemeTheme.myTheme,
    );
  }
}
