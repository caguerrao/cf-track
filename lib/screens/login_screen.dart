import 'package:flutter/material.dart';
import 'package:track/ui/input_decorations.dart';
import 'package:track/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          CardContainer(
              child: Column(
            children: [
              const SizedBox(height: 10),
              Text("Login", style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 10),
              _LoginForm(),
              const SizedBox(height: 10),
            ],
          )),
          const SizedBox(height: 50),
          const Text(
            "Crear una nueva cuenta",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecorations(
              hintText: "+56912345678",
              labelText: "Teléfono",
              prefixIcon: Icons.phone_android),
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecorations(
            prefixIcon: Icons.looks_5_outlined,
            hintText: "**************",
            labelText: "Contraseña",
          ),
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          elevation: 0,
          color: Colors.deepPurple,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: const Text(
              "Ingresar",
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: () {},
        )
      ],
    ));
  }
}
