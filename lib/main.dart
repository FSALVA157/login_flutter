import 'package:flutter/material.dart';
import 'package:flutter_productos/screens/screens.dart';
import 'package:flutter_productos/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthService())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'checkin',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'registro': (_) => RegisterScreen(),
        'checkin': (_) => CheckAuthScreen()
      },
    );
  }
}
