import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  String _baseUrl = "identitytoolkit.googleapis.com";
  String _firebaseToken = "AIzaSyAzavFEg_0JC3CYvIGd07ZdwXfiXpOpNQg";

  final storage = new FlutterSecureStorage();

  Future<dynamic> createUser(String correo, String clave) async {
    final Map<String, dynamic> authData = {"email": correo, "password": clave};

    final url = Uri.https(
        this._baseUrl, "/v1/accounts:signUp", {"key": this._firebaseToken});

    final respuesta = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> respDecoded = json.decode(respuesta.body);

    if (respDecoded.containsKey('idToken')) {
      await storage.write(key: 'token', value: respDecoded['idToken']);
    }

    return respDecoded;
  }

  Future<dynamic> loginUser(String correo, String clave) async {
    final Map<String, dynamic> authData = {"email": correo, "password": clave};

    final url = Uri.https(this._baseUrl, '/v1/accounts:signInWithPassword',
        {"key": this._firebaseToken});

    final respuesta = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> respDecoded = json.decode(respuesta.body);

    if (respDecoded.containsKey('idToken')) {
      await storage.write(key: 'token', value: respDecoded['idToken']);
    }

    return respDecoded;
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future checkToken() async {
    return await storage.read(key: 'token') ?? " ";
  }
}
