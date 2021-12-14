import 'package:flutter/material.dart';
import 'package:flutter_productos/services/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              await authService.logout();
            },
            icon: Icon(Icons.logout)),
        title: Text('PAGINA DE NAVEGACION'),
      ),
      body: Center(
        child: Text('BIENVENIDO A LA APLICACION'),
      ),
    );
  }
}
