import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_productos/providers/login_form_provider.dart';
import 'package:flutter_productos/services/services.dart';
import 'package:flutter_productos/ui/input_decorations.dart';
import 'package:flutter_productos/widgets/widgets.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                    'Registro',
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
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: Text(
                '¿Ya tienes una cuenta?',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(StadiumBorder()),
                  overlayColor: MaterialStateProperty.all(
                      Colors.indigo.withOpacity(0.1))),
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
    //AuthService authService = Provider.of<AuthService>(context);

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
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          dialog_process.show();

                          Map<String, dynamic> data =
                              await authService.createUser(
                                  loginFormProvider.email,
                                  loginFormProvider.password);
                          loginFormProvider.isLoading = false;
                          if (data.containsKey('idToken')) {
                            //loginFormProvider.isLoading = false;
                            String token = data['idToken'];
                            print(token);
                            errorDialog.dismiss();
                            StylishDialog(
                                context: context,
                                alertType: StylishDialogType.SUCCESS,
                                titleText: 'Registro Exitoso!',
                                contentText:
                                    'Ha sido incorporado a la Base de Datos',
                                confirmButton: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, 'home');
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Aceptar',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.teal),
                                  ),
                                )
                                // confirmPressEvent: () {

                                //
                                // },
                                ).show();
                          } else {
                            String errorMessage = data['error']['message'];
                            //loginFormProvider.isLoading = false;
                            errorDialog.dismiss();
                            StylishDialog(
                                    context: context,
                                    alertType: StylishDialogType.ERROR,
                                    titleText: 'ERROR DE REGISTRO!',
                                    contentText: '$errorMessage')
                                .show();
                            return;
                          }
                        }
                        ;
                      },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.greenAccent,
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
