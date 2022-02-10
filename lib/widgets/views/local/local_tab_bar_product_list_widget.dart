import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show BuildContext, Colors, Key, StatelessWidget, Tab, TabBar, Widget;

class LocalTabBarProductListWidget extends StatelessWidget {
  const LocalTabBarProductListWidget({
    Key? key,
    required this.states,
  }) : super(key: key);

  final List<Map<String, String>> states;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: ColorTheme.primaryColor,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey[400],
      isScrollable: true,
      tabs: states.map((state) {
        return Tab(
          text: state['label'],
        );
      }).toList(),
    );
  }
}
