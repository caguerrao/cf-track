import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:track/providers/providers.dart';
import 'package:track/services/services.dart';
import 'package:track/sistema.dart';
import 'package:track/utils/comunes.dart';
import 'package:track/utils/preferences.dart';
import 'package:track/utils/personalizacion.dart' as prs;

import 'pages/pages.dart';

final internetChecker = CheckInternetConnection();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(const AppTrack());
}

class AppTrack extends StatelessWidget {
  const AppTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => PlanillasProvider(), lazy: false),
      ChangeNotifierProvider(create: (_) => LoginFormProvider()),
      ChangeNotifierProvider(create: (_) => AuthService())
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String ruta = '';
    if (Preferences.token != '') {
      ruta = Preferences.tipoUsuario;
    } else {
      ruta = 'login';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: Sistema.isModeDebug,
      title: Sistema.nameApp,
      //supportedLocales: const [Locale('es', 'ES')],
      //locale: const Locale('es', 'ES'),
      initialRoute: ruta,
      routes: {
        '/': (_) => const LoginPage(),
        'login': (_) => const LoginPage(),
        'despachador': (_) => const DespachadorPage(),
        'planillas': (_) => const PlanillasPage(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData(
          fontFamily: 'Raleway',
          primaryColor: prs.colorAppBar,
          appBarTheme: AppBarTheme(
              elevation: .7, centerTitle: true, color: prs.colorAppBar)),
    );
  }
}
