class Documento {
  Documento({
    required this.id,
    required this.folio,
    required this.tipo,
    required this.nroInt,
    required this.numero,
    required this.entregado,
    required this.cliente,
  });

  int id;
  int folio;
  String tipo;
  int nroInt;
  int numero;
  String entregado;
  String cliente;

  factory Documento.fromMap(Map<String, dynamic> json) => Documento(
        id: json["ID"],
        folio: json["Folio"],
        tipo: json["Tipo"],
        nroInt: json["NroInt"],
        numero: json["Numero"],
        entregado: json["Entregado"],
        cliente: json["Cliente"],
      );

  Map<String, dynamic> toMap() => {
        "ID": id,
        "Folio": folio,
        "Tipo": tipo,
        "NroInt": nroInt,
        "Numero": numero,
        "Entregado": entregado,
        "Cliente": cliente,
      };
}
