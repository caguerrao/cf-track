import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:track/models/models.dart';
import 'package:track/sistema.dart';
import 'package:track/utils/utils.dart';

class PlanillasProvider extends ChangeNotifier {
  final String urlCf = Sistema.urlDominio;
  final String apiActual = '/api/planillas/asignada/';
  final int usuario = 5;
  final String token = Preferences.token;

  List<Planilla> listaPlanilla = [];

  PlanillasProvider() {
    getPlanillasAsignadas();
  }

  getPlanillasAsignadas() async {
    final res = await http.get(Uri.parse("$urlCf$apiActual$usuario"),
        headers: {"cf-token": token});

    if (res.statusCode == 200) {
      final listaPla = ListaPlanilla.fromJson(res.body);
      listaPlanilla = listaPla.planillas;
      notifyListeners();
    }
  }
}
