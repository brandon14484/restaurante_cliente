import 'package:flutter/material.dart';


/// Pantalla para inciar sesión.
class ProvidersScreen extends StatelessWidget {
  static const routeName = '/providers';

  const ProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Botones"),
        ),
        body: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                      color: Colors.green,
                      textColor: Colors.purple,
                      child: Text(
                        "Registrar", style: TextStyle(fontSize: 20.0,),),
                      onPressed: (){}),
                  new RaisedButton(
                      color: Colors.green,
                      textColor: Colors.purple,
                      child: Text(
                        "Bienvenido", style: TextStyle(fontSize: 20.0,),),
                      onPressed: (){}),
                  new RaisedButton(
                      color: Colors.green,
                      textColor: Colors.purple,
                      child: Text(
                        "Derecha", style: TextStyle(fontSize: 20.0,),),
                      onPressed: (){}),
                ],
              )
            ],
          ),
        )
    );
  }
}
