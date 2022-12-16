import 'package:flutter/material.dart';
import 'package:track/utils/utils.dart';
import 'package:overlay_support/overlay_support.dart';

class HomePage extends StatelessWidget {
  final String name = "¡Hola Christian Guerra!";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(name,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo)),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 180,
            decoration: miBoxDecoration(),
            child: _Resumen()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BotonesAcciones(
                size: size,
                accion: 'Scanear Planilla',
                icono: Icons.add,
              ),
            ],
          ),
        )
      ],
    )));
  }
}

class _BotonesAcciones extends StatelessWidget {
  final IconData icono;
  final String accion;

  const _BotonesAcciones({
    Key? key,
    required this.size,
    required this.icono,
    required this.accion,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(126, 218, 180, 64),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 5),
      width: size.width * .2,
      height: 100,
      child: GestureDetector(
        onTap: () {
          showSimpleNotification(
              position: NotificationPosition.bottom,
              const Text("kklkflgkj gj gkokoegg jgop tgjotpewepwg"),
              background: Colors.green);
        },
        child: Column(
          children: [
            Icon(
              icono,
              size: 60,
              color: Colors.orange,
            ),
            Text(accion, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

class _Resumen extends StatelessWidget {
  final String titulo = "Planillas de Despacho";
  final String fecha = "11-12-2022";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Column(
            children: [
              Text(titulo,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text(fecha,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange)),
            ],
          ),
          Expanded(child: Container()),
          const Image(
            image: AssetImage('assets/camion.jpg'),
            fit: BoxFit.cover,
            height: 100,
          )
        ]),
        // ignore: prefer_const_literals_to_create_immutables
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const _Total(estado: 'Asignadas', total: '10'),
          const _Total(estado: 'En Ruta', total: '45'),
          const _Total(estado: 'Pendiente', total: '7'),
          const _Total(estado: 'Entregadas', total: '0'),
        ])
      ],
    );
  }
}

class _Total extends StatelessWidget {
  final String total;
  final String estado;

  const _Total({required this.total, required this.estado});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(total,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.indigo)),
      Text(estado, style: const TextStyle(fontSize: 12)),
    ]);
  }
}
