import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  String _baseUrl = "identitytoolkit.googleapis.com";
  String _firebaseToken = "AIzaSyAzavFEg_0JC3CYvIGd07ZdwXfiXpOpNQg";

  Future<String?> createUser(String correo, String clave) async {
    print('INGRESANDO AL CREATE USER SERVICE!1');
    final Map<String, dynamic> authData = {"email": correo, "password": clave};

    final url = Uri.https(
        this._baseUrl, "/v1/accounts:signUp", {"key": this._firebaseToken});
    print(url.toString());

    final respuesta = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> respDecoded = jsonDecode(respuesta.body);

    print(respDecoded);
    return respDecoded.toString();
  }
}
