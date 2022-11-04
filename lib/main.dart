import 'package:flutter/material.dart';
import 'screens/screen.dart';

void main() {
  runApp(const AppTrack());
}

class AppTrack extends StatelessWidget {
  const AppTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Track App',
        initialRoute: 'login',
        routes: {
          'login': (_) => const LoginScreen(),
          'home': (_) => const HomeScreen(),
        },
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey,
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0),
        ));
  }
}
