import 'package:flutter/material.dart';
import 'package:flutter_productos/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            CardContainer(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Login',
                    style: ThemeData().textTheme.headline4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Formulario',
                    style: ThemeData().textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
