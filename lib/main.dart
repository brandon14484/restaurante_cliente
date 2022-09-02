import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:restaurante_cliente/screens/cash-register/cash_register_screen.dart';
import 'package:restaurante_cliente/screens/cellar-providers/cellar_providers_screen.dart';
import 'package:restaurante_cliente/screens/cellar-recipe/cellar_recipe.dart';
import 'package:restaurante_cliente/screens/cellar/cellar_screen.dart';
import 'package:restaurante_cliente/screens/first-page-admin/first_page_admin_screen.dart';
import 'package:restaurante_cliente/screens/kitchen-page/table_order_screen.dart';
import 'package:restaurante_cliente/screens/providers/providers_screen.dart';
import 'package:restaurante_cliente/screens/table/index/table_index_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'theme/my_themes.dart';
import 'redux/auth/auth_middleware.dart';
import 'redux/auth/auth_actions.dart';
import 'redux/app_redux.dart';
import 'screens/main/main_screen.dart';
import 'package:form_validator/form_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late Store<AppState> store;

  /// Inicia estado global y comprueba estado de sesión de usuario.
  @override
  initState() {
    super.initState();

    store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [
        const NavigationMiddleware<AppState>(),
        ...createAuthMiddleware(),
      ],
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        store.dispatch(AuthValidateAction());
        ValidationBuilder.setLocale('es');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: _buildApp(),
    );
  }

  _buildApp() {
    return MaterialApp(
      title: 'Restaurant XXI',
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lightTheme,
      navigatorKey: NavigatorHolder.navigatorKey,
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        ProvidersScreen.routeName: (context) => const ProvidersScreen(),
        FirstPageAdminScreen.routeName: (context) =>
            const FirstPageAdminScreen(),
        CashRegisterScreen.routeName: (context) => const CashRegisterScreen(),
        CellarScreen.routeName: (context) => const CellarScreen(),
        CellarRecipeScreen.routeName: (context) => const CellarRecipeScreen(),
        CellarProvidersScreen.routeName: (context) =>
            const CellarProvidersScreen(),
        TableOrderScreen.routeName: (context) => const TableOrderScreen(),
        TableIndexScreen.routeName: (context) => const TableIndexScreen(),
      },
    );
  }
}
