import 'package:flutter/material.dart';
import 'package:flutter_productos/services/services.dart';
import 'package:flutter_productos/widgets/widgets.dart';
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
        title: Center(child: Text('Productos')),
      ),
      body: Center(child: ListView.builder(
          //itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
        return ProductsCard();
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
