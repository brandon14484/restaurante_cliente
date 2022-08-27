import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Municipalidad de Padre Hurtado'),
      ),
      body: const Center(
        child: Text("Hola, este es el Home"),
      ),
    );
  }
}
