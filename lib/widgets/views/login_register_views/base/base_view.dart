import 'package:delivery_app/views/views.dart' show LoginView;
import 'package:delivery_app/widgets/widgets.dart' show TitleCircleWidget;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Column,
        EdgeInsets,
        FontWeight,
        Hero,
        Icon,
        IconButton,
        Icons,
        Key,
        ModalRoute,
        Navigator,
        Positioned,
        SingleChildScrollView,
        SizedBox,
        Stack,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class BaseView extends StatelessWidget {
  final String title;
  final Widget hero;
  final Widget form;

  const BaseView({
    Key? key,
    required this.title,
    required this.hero,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String router = ModalRoute.of(context)?.settings.name ?? '';

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 50),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            const Positioned(
              child: Hero(tag: 'HeroId', child: TitleCircleWidget()),
              top: -80,
              left: -100,
            ),
            if (LoginView.routerName == router) _titleLogin(router),
            if (LoginView.routerName != router) _titleRegister(router),
            if (LoginView.routerName != router) _iconBack(context),
            Column(
              children: <Widget>[
                hero,
                form,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned _titleLogin(String router) => Positioned(
        child: Text(
          title.toUpperCase(),
          style: _styleTextCircle(router),
        ),
        top: 60,
        left: 25,
      );

  Positioned _titleRegister(String router) => Positioned(
        child: Text(
          title.toUpperCase(),
          style: _styleTextCircle(router),
        ),
        top: 60,
        left: 28,
      );

  Positioned _iconBack(BuildContext context) => Positioned(
        top: 45,
        left: -5,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(LoginView.routerName);
          },
        ),
      );

  TextStyle _styleTextCircle(String router) {
    return TextStyle(
      fontSize: LoginView.routerName == router ? 22 : 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}
