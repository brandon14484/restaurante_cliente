import 'package:flutter/material.dart';

  class HomeAdminPageWidget extends StatelessWidget {
  const HomeAdminPageWidget({super.key});

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Column(
        children: [
          new RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                "Ingeresar",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                 // codigo del la acción a realizar
              }),

          Text(
            "Administración",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

}
