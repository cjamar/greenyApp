import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  CustomFAB({
    Key? key, this.onPressed
  }) : super(key: key);

  // bool isAddedPlant=false;
  final Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton.extended(
       label: const Text('Añadir planta', style: TextStyle(fontFamily: 'Montserrat')),
       icon: const Icon(Icons.add),
       backgroundColor: Colors.green,
       onPressed: onPressed
      ),
    );
  }
}