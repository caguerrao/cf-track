import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

// tipoUsuario= 'Administrador','Despachador'
  static String _tipoUsuario = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get tipoUsuario {
    return _prefs.getString('tipoUsuario') ?? _tipoUsuario;
  }

  static set tipoUsuario(String tipoUsuario) {
    _tipoUsuario = tipoUsuario;
    _prefs.setString('tipoUsuario', tipoUsuario);
  }

  static String get simCountryCode {
    return _prefs.getString('simCountryCode') ?? 'CL';
  }

  static set simCountryCode(String value) {
    _prefs.setString('simCountryCode', value.toUpperCase());
  }

  static String get token {
    return _prefs.getString('token') ?? '';
  }

  static set token(String value) {
    _prefs.setString('token', value);
  }

  static String get patente {
    return _prefs.getString('patente') ?? '';
  }

  static set patente(String value) {
    _prefs.setString('patente', value);
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  static set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  static logout() {
    _prefs.remove('token');
  }
}
