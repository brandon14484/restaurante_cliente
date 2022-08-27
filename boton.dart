import 'package:flutter/material.dart';
import 'package:restaurante_cliente/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Menu Restaurant',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
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
                            "Izquierda", style: TextStyle(fontSize: 20.0,),),
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

        )


    );
  }
}