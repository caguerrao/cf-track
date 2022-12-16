import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:track/main.dart';

import '../utils/utils.dart';

class ConnectionStatusChangeNotifier extends ChangeNotifier {
  late StreamSubscription _connectionSubscription;

  ConnectionStatus status = ConnectionStatus.online;

  ConnectionStatusChangeNotifier() {
    _connectionSubscription =
        internetChecker.internetStatus().listen((newStatus) {
      status = newStatus;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}
