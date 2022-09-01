import 'package:flutter/material.dart';

/// Pantalla para inciar sesión.
class CashRegisterScreen extends StatelessWidget {
  static const routeName = '/cash_register';
  const CashRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema de Finazas "),
      ),
      body: Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      color: Colors.green,
                      textColor: Colors.purple,
                      child: Text(
                        "Ingresos Y Egresos",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {}),
                ],
              )
            ]),
      ),
    );
  }
}
