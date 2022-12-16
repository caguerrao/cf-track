import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';
import '../services/services.dart';

import '../utils/preferences.dart';
import '../utils/personalizacion.dart' as prs;
import '../utils/comunes.dart' as utils;
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Scaffold(
        body: ModalProgressHUD(
            inAsyncCall: loginForm.isLoading,
            child: SingleChildScrollView(
                child: Center(
                    child: SizedBox(
                        width: prs.anchoFormulario, child: _Contenido())))));
  }
}

class _Contenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          const RedStatus(),
          const SizedBox(height: 25.0),
          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 90.0),
              child: Column(
                children: [
                  const Image(
                      image: AssetImage('assets/icon_.png'), width: 215.0),
                  const SizedBox(height: 40.0),
                  const Text('Ingreso de Usuarios',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 45.0),
                  Form(
                    key: loginForm.formKey,
                    child: Column(
                      children: <Widget>[
                        _CreaCelular(loginForm: loginForm),
                        const SizedBox(height: 10.0),
                        _CreaPassword(loginForm: loginForm),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: prs.colorButtonPrimary,
                            foregroundColor: prs.colorTextButtonPrimary,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: prs.colorTextButtonPrimary,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: () async {
                          final navigator = Navigator.of(context);
                          FocusScope.of(context).unfocus();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);

                          if (loginForm.telefono.toString().length != 12 ||
                              loginForm.password.toString().length <= 4) {}
                          if (loginForm.isValidForm()) {
                            loginForm.isLoading = true;

                            final String? errorMessage = await authService
                                .login(loginForm.telefono, loginForm.password);

                            if (errorMessage == null) {
                              loginForm.isLoading = false;
                              navigator.pushReplacementNamed('despachador');
                            } else {
                              NotificationsService.showSnackBar(errorMessage);
                              loginForm.isLoading = false;
                            }
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(16.0),
                          child: const Text('INICIAR SESION'),
                        )),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ))
        ],
      ),
    );
  }
}

class _CreaCelular extends StatelessWidget {
  const _CreaCelular({
    Key? key,
    required this.loginForm,
  }) : super(key: key);

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 5.0),
        Expanded(
          child: utils.crearCelular(
              Preferences.simCountryCode, (_onChangedCelular)),
        )
      ],
    );
  }

  _onChangedCelular(phone) {
    loginForm.telefono = phone;
  }
}

class _CreaPassword extends StatelessWidget {
  const _CreaPassword({
    Key? key,
    required this.loginForm,
  }) : super(key: key);

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: true,
        maxLength: 12,
        decoration: prs.decoration('Contraseña', null),
        onChanged: (value) => loginForm.password = value,
        validator: (value) {
          if (value != null && value.length >= 5) return null;
          return 'Mínimo 4 caracteres';
        });
  }
}
