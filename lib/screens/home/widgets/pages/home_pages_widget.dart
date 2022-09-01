import 'package:flutter/material.dart';
import 'package:restaurante_cliente/screens/home/widgets/pages/administration/home_admin_page_widget.dart';
import 'package:restaurante_cliente/screens/home/widgets/pages/kitchen/home_kitchen_page_widget.dart';

/// SubPáginas que se mostrarán en la pantalla de inicio.
class HomePagesWidget extends StatelessWidget {
  final int page;

  const HomePagesWidget({
    super.key,
    required this.page,
  });

  @override
  build(BuildContext context) {
    // Todo quizá hay que modificar esto
    List<Widget> pages = [
      const HomeAdminPageWidget(),
      const HomeKitchenPageWidget(),
      new Text('Finanzas'),
      new Text('Bodega')
    ];

    return Container(
      alignment: Alignment.topLeft,
      child: pages[page],
    );
  }
}
