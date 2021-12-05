import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_productos/ui/input_decorations.dart';
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
                  _Formulario()
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Crear una cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      )),
    );
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authDecoration(
                hinttxt: 'john.doe@gmail.com',
                labeltxt: 'Email: ',
                prefix: Icons.alternate_email_sharp),
          ),
          const SizedBox(height: 30.0),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecorations.authDecoration(
                hinttxt: 'clave de acceso',
                labeltxt: 'Password: ',
                prefix: Icons.lock_outline),
          ),
          const SizedBox(height: 50.0),
          MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.deepPurple,
            elevation: 0,
            disabledColor: Colors.grey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                'Ingresar',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      )),
    );
  }
}
