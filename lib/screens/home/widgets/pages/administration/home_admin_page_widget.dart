import 'package:flutter/material.dart';
import 'package:restaurante_cliente/screens/cash-register/cash_register_screen.dart';
import 'package:restaurante_cliente/screens/providers/providers_screen.dart';
import '../../../../first-page-admin/first_page_admin_screen.dart';

class HomeAdminPageWidget extends StatelessWidget {
  const HomeAdminPageWidget({super.key});

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
                "Ingresos Nuevos",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, FirstPageAdminScreen.routeName);
                // codigo del la acción a realizar
              }),
          new RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                "Proveedores",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, ProvidersScreen.routeName);
                // codigo del la acción a realizar
              }),
          new RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                "Caja",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, CashRegisterScreen.routeName);
              }),
        ],
      ),
    );
  }
}
