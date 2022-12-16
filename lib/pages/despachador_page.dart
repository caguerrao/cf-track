import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../models/models.dart';
// import '../providers/providers.dart';
import '../widgets/widgets.dart';

class DespachadorPage extends StatelessWidget {
  const DespachadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//  final planillasProvider = Provider.of<PlanillasProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planilla'),
      ),
      drawer: const MenuDespachador(),
      body: SingleChildScrollView(
          child:
              Column(children: const [SizedBox(height: 25), Text('lorem ')])),
    );
  }
}
