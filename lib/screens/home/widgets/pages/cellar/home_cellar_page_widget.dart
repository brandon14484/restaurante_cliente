import 'package:flutter/material.dart';
import 'package:restaurante_cliente/screens/cellar-providers/cellar_providers_screen.dart';
import 'package:restaurante_cliente/screens/cellar-recipe/cellar_recipe.dart';
import 'package:restaurante_cliente/screens/cellar/cellar_providers_screen.dart';
import 'package:restaurante_cliente/screens/cellar/cellar_recipe.dart';
import 'package:restaurante_cliente/screens/cellar/cellar_screen.dart';


class HomeCellarPageWidget extends StatelessWidget {
  const HomeCellarPageWidget({super.key});

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                "Ingreso De Producto",
                style: TextStyle( fontSize: 20.0,),
              ),
              onPressed: () {
                Navigator.pushNamed(context, CellarScreen.routeName);
                // codigo del la acción a realizar
              }),
          new RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                "Recetas",
                style: TextStyle( fontSize: 20.0,),
              ),
              onPressed: () {
                Navigator.pushNamed(context, CellarRecipeScreen.routeName.);
                // codigo del la acción a realizar
              }),
          new RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                "Compra A Proveedores",
                style: TextStyle( fontSize: 20.0,),
              ),
              onPressed: () {
                Navigator.pushNamed(context, CellarProvidersScreen.routeName);
                // codigo del la acción a realizar
              }),
        ],
      ),
    );
  }

}
