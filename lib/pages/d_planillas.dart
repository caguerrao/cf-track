import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:track/models/models.dart';
import 'package:track/providers/planillas_provider.dart';

class PlanillasPage extends StatelessWidget {
  const PlanillasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final planillasProvider = Provider.of<PlanillasProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planilla'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(height: 25),
            _ListaPlanillas(
              titulo: 'Asignadas (${planillasProvider.listaPlanilla.length})',
              planillas: planillasProvider.listaPlanilla,
            ),
          ],
        ),
      ),
      floatingActionButton: const _BotonAgregarPlanilla(),
    );
  }
}

class _ListaPlanillas extends StatelessWidget {
  final String titulo;
  final List<Planilla> planillas;

  const _ListaPlanillas({required this.titulo, required this.planillas});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(titulo,
                style:
                    const TextStyle(fontSize: 31, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: planillas.length,
                itemBuilder: (_, index) =>
                    _PlanillaCard(folio: planillas[index].folio)),
          )
        ],
      ),
    );
  }
}

class _PlanillaCard extends StatelessWidget {
  final int folio;

  const _PlanillaCard({required this.folio});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      // color: Colors.green,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.indigo.shade200, //light blue
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(folio.toString(),
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),
          subtitle:
              const Text("njjenvueqnverqnvquvo nfrhufn ruf´nfru eqfruqefhquf"),
          // trailing: const Icon(Icons.accessible_outlined),
          leading: const Image(image: AssetImage('assets/camion.jpg'))),
    );
  }
}

class _BotonAgregarPlanilla extends StatelessWidget {
  const _BotonAgregarPlanilla({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancelar', false, ScanMode.BARCODE);

          // ignore: avoid_print
          print(barcodeScanRes);
        },
        child: const Icon(Icons.add_road));
  }
}
