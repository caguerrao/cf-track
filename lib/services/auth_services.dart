import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:track/sistema.dart';
import 'package:track/utils/utils.dart';

class AuthService extends ChangeNotifier {
  final String urlCf = Sistema.urlDominio;
  final String apiActual = '/api/auth/login';
  final headers = {"Content-type": "application/json"};

  Future<String?> login(String telefono, String password) async {
    final Map<String, dynamic> authData = {
      'Telefono': telefono,
      'Password': password
    };

    final res = await http.post(Uri.parse("$urlCf$apiActual"),
        body: json.encode(authData), headers: headers);

    final Map<String, dynamic> decodedResp = json.decode(res.body);

    if (decodedResp.containsKey('token')) {
      // salvar token

      Preferences.nombre = decodedResp['usuario']['Nombre'];
      Preferences.tipoUsuario = decodedResp['usuario']['esDespachador'] == true
          ? 'despachador'
          : decodedResp['usuario']['esCliente'] == true
              ? 'cliente'
              : '';
      Preferences.patente = decodedResp['usuario']['Patente'];
      Preferences.token = decodedResp['token'];

      return null;
    } else {
      return decodedResp['msg'];
    }
  }

  Future logout() async {
    await Preferences.logout();
    return;
  }

  String readToken() {
    return Preferences.token;
  }
}
