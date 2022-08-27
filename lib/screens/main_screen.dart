import 'package:flutter/material.dart';
import 'package:restaurante_cliente/screens/botones_screen.dart';

class MainScreen extends StatelessWidget{
  static const routeName = '/';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hola"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 16),
              onPressed: () => _login(context),
              height: 40,
              minWidth: 170,
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                'Login',
              ),
            ),
          ],
        ),
      ),
    );
  }

  _login(BuildContext context){
    var user = _authenticate();
    _redirect(context);
  }

  _authenticate(){
    // Conexion a la API
    // API -> BD
    // Retorna un usuario
    return {
      "rut": "199827081",
      "nombre": "Francisco Tapia"
    };
  }

  _redirect(BuildContext context){
    Navigator.pushNamed(context, BotonesScreen.routeName);
  }
}