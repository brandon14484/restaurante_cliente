import 'package:flutter/material.dart';

class HomeAdminPageWidget extends StatelessWidget {
  const HomeAdminPageWidget({super.key});

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Column(
        children: [
          Text(
            "Administración",
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
