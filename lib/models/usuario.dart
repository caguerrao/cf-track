class Usuario {
  Usuario({
    this.id,
    this.usuario,
    this.mail,
    this.nombre,
    this.telefono,
    this.password,
    this.activo,
    this.validado,
    this.conectado,
    this.rut,
    this.rutEmpresa,
    this.nombreEmpresa,
    this.direccion,
    this.esAdmin,
    this.esDespachador,
    this.esCliente,
    this.codigoVerificacion,
    this.fechaCrea,
    this.patente,
  });

  int? id;
  String? usuario;
  String? mail;
  String? nombre;
  String? telefono;
  String? password;
  bool? activo;
  bool? validado;
  bool? conectado;
  String? rut;
  String? rutEmpresa;
  String? nombreEmpresa;
  String? direccion;
  bool? esAdmin;
  bool? esDespachador;
  bool? esCliente;
  String? codigoVerificacion;
  DateTime? fechaCrea;
  String? patente;

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["Usuario"],
        mail: json["Mail"],
        nombre: json["Nombre"],
        telefono: json["Telefono"],
        password: json["Password"],
        activo: json["Activo"],
        validado: json["Validado"],
        conectado: json["Conectado"],
        rut: json["Rut"],
        rutEmpresa: json["RutEmpresa"],
        nombreEmpresa: json["NombreEmpresa"],
        direccion: json["Direccion"],
        esAdmin: json["esAdmin"],
        esDespachador: json["esDespachador"],
        esCliente: json["esCliente"],
        codigoVerificacion: json["CodigoVerificacion"],
        fechaCrea: DateTime.parse(json["FechaCrea"]),
        patente: json["Patente"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Usuario": usuario,
        "Mail": mail,
        "Nombre": nombre,
        "Telefono": telefono,
        "Password": password,
        "Activo": activo,
        "Validado": validado,
        "Conectado": conectado,
        "Rut": rut,
        "RutEmpresa": rutEmpresa,
        "NombreEmpresa": nombreEmpresa,
        "Direccion": direccion,
        "esAdmin": esAdmin,
        "esDespachador": esDespachador,
        "esCliente": esCliente,
        "CodigoVerificacion": codigoVerificacion,
        "FechaCrea": fechaCrea?.toIso8601String(),
        "Patente": patente,
      };
}
