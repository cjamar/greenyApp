import 'package:flutter/material.dart';
import 'package:greeny_app/widgets/widgets.dart';


class MisPlantas extends StatelessWidget {
  const MisPlantas({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis plantas'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
          ],
        ),
      )
   );
  }
}

