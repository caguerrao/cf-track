import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../utils/utils.dart';

class RedStatus extends StatelessWidget {
  const RedStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConnectionStatusChangeNotifier(),
      child: Consumer<ConnectionStatusChangeNotifier>(
          builder: (context, value, child) {
        return Visibility(
            visible: value.status != ConnectionStatus.online,
            child: Container(
              //padding: const EdgeInsets.all(16),
              height: 60,
              width: double.infinity,
              color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.wifi_off),
                  SizedBox(width: 8),
                  Text('Sin Conexión a Internet')
                ],
              ),
            ));
      }),
    );
  }
}
