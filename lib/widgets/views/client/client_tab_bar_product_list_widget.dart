import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show BuildContext, Colors, Key, StatelessWidget, Tab, TabBar, Widget;

class ClientTabBarProductListWidget extends StatelessWidget {
  const ClientTabBarProductListWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List? categories;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: ColorTheme.primaryColor,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey[400],
      isScrollable: true,
      tabs: categories!.map((category) {
        return Tab(
          text: category['label'],
        );
      }).toList(),
    );
  }
}
