import 'package:flutter/material.dart';
import 'package:restaurante_cliente/screens/home/widgets/home_rail_widget.dart';
import 'package:restaurante_cliente/screens/home/widgets/pages/home_pages_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant XXI - Administración'),
      ),
      body: Row(
        children: [
          HomeRailWidget(
            currentPage: _currentPage,
            onPageChanged: _onPageChanged,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          HomePagesWidget(page: _currentPage),
        ],
      ),
    );
  }

  /// Actualiza la página cuando se cambia el botón
  _onPageChanged(int newPage) => setState(() => _currentPage = newPage);
}
