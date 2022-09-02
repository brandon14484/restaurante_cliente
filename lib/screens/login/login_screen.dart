import 'package:flutter/material.dart';

import './widgets/login_form_widget.dart';
import '../../widgets/ui/ui.dart' show UiScaffoldImgWithCenteredContainerWidget;

/// Pantalla para inciar sesión.
class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiScaffoldImgWithCenteredContainerWidget(
      child: SafeArea(
        child: LoginFormWidget(),
      ),
    );
  }
}
