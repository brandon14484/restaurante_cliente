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
          icon: Icon(Icons.soup_kitchen_outlined),
          selectedIcon: Icon(Icons.kitchen),
          label: Text('Cocina'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.attach_money_outlined),
          selectedIcon: Icon(Icons.money),
          label: Text('Finanzas'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.warehouse_rounded),
          selectedIcon: Icon(Icons.warehouse_outlined),
          label: Text('Bodega'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: Text('Configuración'),
        ),
      ],
    );
  }
}