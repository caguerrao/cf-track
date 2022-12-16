import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/subjects.dart';

import 'package:track/utils/personalizacion.dart' as prs;
import 'package:track/utils/utils.dart';

BoxDecoration miBoxDecoration() => BoxDecoration(
      border: Border.all(
        color: Colors.indigo,
        width: .5,
      ),
      borderRadius: BorderRadius.circular(20),
    );

Widget crearCelular(String simCountryCode, Function onInputChanged,
    {String celular = ''}) {
  return InternationalPhoneNumberInput(
    onInputChanged: (PhoneNumber phoneNumber) {
      Preferences.simCountryCode = phoneNumber.isoCode!;
      onInputChanged(phoneNumber.phoneNumber.toString());
    },
    maxLength: 9,
    inputDecoration: prs.decoration('Celular', null),
    ignoreBlank: true,
    autoValidateMode: AutovalidateMode.disabled,
    formatInput: false,
    onInputValidated: (a) => {true},
    selectorConfig:
        const SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
    errorMessage: 'Celular incorrecto',
    initialValue: PhoneNumber(isoCode: simCountryCode, phoneNumber: celular),
  );
}

enum ConnectionStatus { online, offline }

class CheckInternetConnection {
  final Connectivity _connectivity = Connectivity();

  final _controller = BehaviorSubject.seeded(ConnectionStatus.online);
  StreamSubscription? _connectionSubscription;

  CheckInternetConnection() {
    _checkInternetConnection();
  }

  Stream<ConnectionStatus> internetStatus() {
    _connectionSubscription ??= _connectivity.onConnectivityChanged
        .listen((_) => _checkInternetConnection());
    return _controller.stream;
  }

  Future<void> _checkInternetConnection() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _controller.sink.add(ConnectionStatus.online);
      } else {
        _controller.sink.add(ConnectionStatus.offline);
      }
    } on SocketException catch (_) {
      _controller.sink.add(ConnectionStatus.offline);
    }
  }

  Future<void> close() async {
    await _connectionSubscription?.cancel();
    await _controller.close();
  }
}
