import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anchoTotal = MediaQuery.of(context).size.width;
    final altoTotal = MediaQuery.of(context).size.height;
    return Container(
      width: anchoTotal,
      height: altoTotal,
      color: Colors.grey,
      child: Stack(
        children: [
          _PurpleBox(
            ancho: anchoTotal,
            alto: altoTotal,
          ),
          _headIcon(),
          this.child
        ],
      ),
    );
  }
}

class _headIcon extends StatelessWidget {
  const _headIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        left: 50,
        right: 50,
        child: Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ));
  }
}

class _PurpleBox extends StatelessWidget {
  final double ancho;
  final double alto;

  const _PurpleBox({Key? key, required this.ancho, required this.alto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      height: alto * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: _Bubbles()),
          Positioned(top: -40, left: -30, child: _Bubbles()),
          Positioned(top: -50, right: -20, child: _Bubbles()),
          Positioned(bottom: -50, left: 10, child: _Bubbles()),
          Positioned(bottom: 120, right: 20, child: _Bubbles())
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 100, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

class _Bubbles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.06)),
    );
  }
}
