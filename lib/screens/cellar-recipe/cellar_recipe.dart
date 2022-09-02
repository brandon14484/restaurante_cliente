import 'package:flutter/material.dart';


/// Pantalla para inciar sesión.
class CellarRecipeScreen extends StatelessWidget {
  static const routeName = '/cellar-recipe';

  const CellarRecipeScreen({super.key});

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
                        "Nueva  ", style: TextStyle(fontSize: 20.0,),),
                      onPressed: (){}),
                  new RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "Eliminar ", style: TextStyle(fontSize: 20.0,),),
                      onPressed: (){}),
                ],
              )
            ],
          ),
        )
    );
  }
}
