import 'package:flutter/material.dart';


/// Pantalla para inciar sesión.
class ProvidersScreen extends StatelessWidget {
  static const routeName = '/providers';

  const ProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PEDIDOS"),
        ),
        body: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "Nuevo Pedido", style: TextStyle(fontSize: 20.0,),),
                      onPressed: (){}),
                  new RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "Historial De Pedidos", style: TextStyle(fontSize: 20.0,),),
                      onPressed: (){}),

                ],
              )
            ],
          ),
        )
    );
  }
}
