import 'package:flutter/material.dart';


class CardPlant1 extends StatelessWidget {
  const CardPlant1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      boxShadow:[ 
        BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      )],
      ),
      width: size.width*0.45,
      height: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.greenAccent,
            height: 150,
            width: size.width,
            child: const Image(
              image: NetworkImage('https://begreen.imgix.net/5f7c2d9f33c72269608069.jpg?auto=format'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 234, 234, 234),
            height: 80,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nombre estándar de la planta', style: TextStyle(color: Colors.green[600], fontSize: 13, fontWeight: FontWeight.bold, overflow: TextOverflow.clip), textAlign: TextAlign.center),
               const SizedBox(height: 5),
               const Text('Nombre científico', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
