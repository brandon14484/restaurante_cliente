import 'package:flutter/material.dart';
import 'package:restaurante_cliente/screens/kitchen-page/table_order_screen.dart';

class HomeKitchenPageWidget extends StatelessWidget {
  const HomeKitchenPageWidget({super.key});

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
                "Ordenes",
                style: TextStyle( fontSize: 20.0,),
              ),
              onPressed: () {
                Navigator.pushNamed(context, TableOrderScreen.routeName);
                // codigo del la acción a realizar
              }),
        ],
      ),
    );
  }

}
