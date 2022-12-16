import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class MenuDespachador extends StatelessWidget {
  const MenuDespachador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(Icons.exit_to_app_outlined),
              title: const Text('Cerrar Sesión'),
              onTap: () {
                authService.logout();
                Navigator.pushReplacementNamed(context, 'login');
              })
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/camion.jpg'),
                    fit: BoxFit.cover))));
  }
}
