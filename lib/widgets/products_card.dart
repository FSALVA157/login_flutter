import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanio = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: tamanio.width,
        height: tamanio.height / 2,
        margin: EdgeInsets.only(top: 30, bottom: 50),
        decoration: _decorationCard(),
        child: Stack(
          children: [_backgroundImage()],
        ),
      ),
    );
  }

  BoxDecoration _decorationCard() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 10.0, color: Colors.black12, offset: Offset(0, 7))
        ]);
  }
}

class _backgroundImage extends StatelessWidget {
  const _backgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanio = MediaQuery.of(context).size;
    return Container(
      width: tamanio.width,
      height: tamanio.height,
      color: Colors.yellow,
    );
  }
}
