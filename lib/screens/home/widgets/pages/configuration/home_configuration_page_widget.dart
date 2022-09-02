import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../../../redux/app_redux.dart' show AppState;
import '../../../../../redux/auth/auth_actions.dart' show AuthLogoutAction;
import '../../../../../widgets/ui/ui.dart' show UiRaisedButton;

class HomeConfigurationPageWidget extends StatelessWidget {
  const HomeConfigurationPageWidget({super.key});

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
           child: Text(
             "Configuración",
             style: Theme.of(context).textTheme.titleLarge,
           ),
          ),
          UiRaisedButton(
            onPressed: () => StoreProvider.of<AppState>(context).dispatch(
              AuthLogoutAction(),
            ),
            text: "Cerrar sesión",
            color: Colors.grey,
            textColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}
