import 'package:flutter/material.dart';

class HomeRailWidget extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageChanged;

  const HomeRailWidget({
    super.key,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  build(BuildContext context) {
    return NavigationRail(
      selectedIndex: currentPage,
      onDestinationSelected: onPageChanged,
      labelType: NavigationRailLabelType.selected,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.admin_panel_settings_outlined),
          selectedIcon: Icon(Icons.admin_panel_settings_sharp),
          label: Text('Administrar'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark_border),
          selectedIcon: Icon(Icons.book),
          label: Text('Second'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.star),
          label: Text('Third'),
        ),
      ],
    );
  }
}