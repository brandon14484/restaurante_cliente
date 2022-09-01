import 'package:flutter/material.dart';

class FirstPageAdminScreen extends StatelessWidget {
  static const routeName = '/first-page-admin';

  const FirstPageAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ingreso")),
        body: Container(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text(
                            "Mesa",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {}),
                      new RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text(
                            "Usuario",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {}),
                      new RaisedButton(
                          color: Colors.deepOrange,
                          textColor: Colors.white,
                          child: Text(
                            "Nuevo Producto",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {})
                    ])
              ]),
        ));
  }
}
