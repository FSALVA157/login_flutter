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
          children: [_backgroundImage(), _ProductDetails(), _ProductPrize()],
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

class _ProductPrize extends StatelessWidget {
  const _ProductPrize({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanio = MediaQuery.of(context).size;

    return Positioned(
        top: 0,
        right: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
          child: Container(
            height: tamanio.height / 10,
            width: tamanio.width * 0.3,
            color: Colors.indigo,
            child: Text(
              "\103.99",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ));
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanio = MediaQuery.of(context).size;
    return Positioned(
        bottom: 0,
        left: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: tamanio.height / 10,
            width: tamanio.width * 0.7,
            color: Colors.indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Disco duro G',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Disco duro G',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                )
              ],
            ),
          ),
        ));
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
