import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_productos/providers/login_form_provider.dart';
import 'package:flutter_productos/ui/input_decorations.dart';
import 'package:flutter_productos/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

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
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _Formulario(),
                  )
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
    LoginFormProvider loginFormProvider =
        Provider.of<LoginFormProvider>(context);

    StylishDialog dialog_process = StylishDialog(
      context: context,
      alertType: StylishDialogType.PROGRESS,
      animationLoop: false,
      titleText: 'Procesando...',
      dismissOnTouchOutside: false,
    );

    StylishDialog errorDialog = StylishDialog(
        context: context,
        alertType: StylishDialogType.ERROR,
        titleText: 'Datos no Válidos!',
        contentText: "controle los datos ingresados");

    return Container(
      child: Form(
          key: loginFormProvider.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authDecoration(
                      hinttxt: 'john.doe@gmail.com',
                      labeltxt: 'Email: ',
                      prefix: Icons.alternate_email_sharp),
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);
                    return regExp.hasMatch(value ?? "")
                        ? null
                        : "Debe ingresar un email válido";
                  },
                  onChanged: (value) => loginFormProvider.email = value),
              const SizedBox(height: 30.0),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecorations.authDecoration(
                    hinttxt: 'clave de acceso',
                    labeltxt: 'Password: ',
                    prefix: Icons.lock_outline),
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : "Ingrese un valor correcto en clave";
                },
                onChanged: (value) => loginFormProvider.password = value,
              ),
              const SizedBox(height: 50.0),
              MaterialButton(
                onPressed: loginFormProvider.isLoading
                    ? null
                    : () async {
                        if (!loginFormProvider.isValidForm()) {
                          errorDialog.show();
                          return;
                        } else {
                          loginFormProvider.isLoading = true;
                          FocusScope.of(context).unfocus();
                          dialog_process.show();
                          await Future.delayed(Duration(seconds: 3));
                          loginFormProvider.isLoading = false;
                          Navigator.pushReplacementNamed(context, 'home');
                        }
                        ;
                      },
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
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
