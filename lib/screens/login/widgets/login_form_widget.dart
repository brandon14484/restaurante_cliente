/// Formulario de inicio de sesión. Tiene RUT y Contraseña.

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:form_validator/form_validator.dart';
import '../../../redux/app_redux.dart' show AppState;
import '../../../redux/auth/auth_actions.dart' show AuthLoginAction;
import '../../../widgets/form/form.dart' show PasswordTextFieldWidget;
import '../../../widgets/ui/ui.dart' show UiRaisedButton, UiTextFormWidget;

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  LoginFormWidgetState createState() => LoginFormWidgetState();
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
            UiTextFormWidget(
              validator: ValidationBuilder().required().email().build(),
              controller: _emailController,
              labelText: "Correo electrónico",
              hintText: "Ingresa tu Correo electrónico...",
              shouldFocus: true,
            ),
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
      username: _emailController.text,
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
