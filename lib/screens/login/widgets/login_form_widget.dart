/// Formulario de inicio de sesión. Tiene RUT y Contraseña.

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import '../../../redux/app_redux.dart' show AppState;
import '../../../redux/auth/auth_actions.dart' show AuthLoginAction;
import '../../../widgets/form/form.dart'
    show RutTextFieldWidget, rutAddTextFieldListener, PasswordTextFieldWidget;
import '../../../widgets/ui/ui.dart' show UiRaisedButton;

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  LoginFormWidgetState createState() => LoginFormWidgetState();
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _rutController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    rutAddTextFieldListener(_rutController);
  }

  @override
  void dispose() {
    _rutController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      "Bienvenido",
                      style: theme.textTheme.headline1?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RutTextFieldWidget(controller: _rutController, shouldFocus: true),
            PasswordTextFieldWidget(controller: _passwordController),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 12,
                right: 20,
                bottom: 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiRaisedButton(
                    onPressed: _onSubmitLogin,
                    text: "Ingresar",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Valida el formulario y luego envía los datos como la acción de Redux
  /// [AuthLoginAction].
  _onSubmitLogin() async {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) return;

    // Imprime los valores del formulario
    final authSubmitAction = AuthLoginAction(
      rut: _rutController.text,
      password: _passwordController.text,
    );
    StoreProvider.of<AppState>(context).dispatch(authSubmitAction);

    String? errorMessage;
    await authSubmitAction.completer.future.catchError((error) {
      errorMessage = error.toString();
    });

    // Todo mostrar error
  }
}
