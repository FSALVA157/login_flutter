import 'package:flutter/material.dart';
import 'package:flutter_productos/screens/screens.dart';
import 'package:flutter_productos/services/services.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: authService.checkToken(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Espere.......');

          if (snapshot.data == " ") {
            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LoginScreen(),
                      transitionDuration: Duration(seconds: 0)));
            });
          } else {
            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomeScreen(),
                      transitionDuration: Duration(seconds: 0)));
            });
          }

          return Container();
        },
      )),
    );
  }
}
