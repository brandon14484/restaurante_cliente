import 'package:flutter/material.dart';


/// Pantalla para inciar sesión.
class CellarScreen extends StatelessWidget {
  static const routeName = '/cellar';

  const CellarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BODEGA"),
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
                        "Stock De Productos", style: TextStyle(fontSize: 20.0,),),
                      onPressed: (){}),
                ],
              )
            ],
          ),
        )
    );
  }
}
