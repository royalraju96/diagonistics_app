import 'package:mindcom/screens/about_screen.dart';
import 'package:mindcom/screens/home_screen.dart';
import 'package:mindcom/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loginStatus;

  @override
  void initState() {
    loginStatus = true;
    super.initState();
  }

  void _setLoginState(bool currentStatus) {
    setState(() {
      loginStatus = currentStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Diagnostic Center',
        theme: ThemeData(
          primaryColor: Colors.cyan,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'RaleWay',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        home: HomeScreen()
        //     loginStatus ? TabsScreen() : LoginScreen(loginStatus, _setLoginState),
        // routes: {
        //   HomeScreen.routeName: (ctx) => HomeScreen(),
        //   LoginScreen.routeName: (ctx) =>
        //       LoginScreen(loginStatus, _setLoginState),
        //   ProductScreen.routeName: (ctx) => ProductScreen(),
        //   UsersScreen.routeName: (ctx) => UsersScreen(),
        //   AboutScreen.routeName: (ctx) => AboutScreen()
        // },
        // initialRoute: HomeScreen.routeName,
        // onUnknownRoute: (settings) {
        //   return MaterialPageRoute(
        //       builder: (ctx) => loginStatus
        //           ? TabsScreen()
        //           : LoginScreen(loginStatus, _setLoginState));

        );
  }
}
