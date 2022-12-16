import 'dart:convert';

import 'package:track/models/models.dart';

class Planilla {
  Planilla({
    this.id,
    required this.folio,
    required this.fechaDespacho,
    required this.estado,
    required this.idUsuarioAsignado,
    required this.documentos,
  });

  int? id;
  int folio;
  DateTime fechaDespacho;
  String estado;
  int idUsuarioAsignado;
  List<Documento> documentos;

  factory Planilla.fromJson(String str) => Planilla.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Planilla.fromMap(Map<String, dynamic> json) => Planilla(
        id: json["id"],
        folio: json["Folio"],
        fechaDespacho: DateTime.parse(json["FechaDespacho"]),
        estado: json["Estado"],
        idUsuarioAsignado: json["IdUsuarioAsignado"],
        documentos: List<Documento>.from(
            json["Documentos"].map((x) => Documento.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Folio": folio,
        "FechaDespacho": fechaDespacho.toIso8601String(),
        "Estado": estado,
        "IdUsuarioAsignado": idUsuarioAsignado,
        "Documentos": List<dynamic>.from(documentos.map((x) => x.toMap())),
      };
}

class ListaPlanilla {
  ListaPlanilla({
    required this.planillas,
  });

  List<Planilla> planillas;

  factory ListaPlanilla.fromJson(String str) =>
      ListaPlanilla.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListaPlanilla.fromMap(Map<String, dynamic> json) => ListaPlanilla(
        planillas: List<Planilla>.from(
            json["planillas"].map((x) => Planilla.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "planillas": List<dynamic>.from(planillas.map((x) => x.toMap())),
      };
}
