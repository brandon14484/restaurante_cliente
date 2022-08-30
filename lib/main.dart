import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'screens/home/widgets/home_screen.dart';
import './screens/login/login_screen.dart';
import './theme/my_themes.dart';
import './redux/auth/auth_middleware.dart';
import './redux/auth/auth_actions.dart';
import './redux/app_redux.dart';
import './screens/main/main_screen.dart';
import 'package:form_validator/form_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
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

  _buildApp(){
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
      },
    );
  }
}
