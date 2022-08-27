import 'package:flutter/material.dart';
import 'package:restaurante_cliente/screens/botones_screen.dart';
import 'package:restaurante_cliente/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant XXI  Bienvenido',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        BotonesScreen.routeName: (context) => const BotonesScreen(),
      },
    );
  }
}
