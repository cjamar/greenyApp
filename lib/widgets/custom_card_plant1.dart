import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';

class CustomCardPlant1 extends StatelessWidget {
  const CustomCardPlant1({
    Key? key, required this.imagen, required this.nombreEstandar, required this.nombreCientifico,
  }) : super(key: key);

  final String imagen;
  final String nombreEstandar;
  final String nombreCientifico;

 @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
       // color: Colors.green,
        height: 140,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: FadeInImage(
            placeholder: const AssetImage('assets/placeholder-img.jpg'),
            image: NetworkImage(imagen),
            fit: BoxFit.cover,
            ),
        )),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
           // color: Colors.black12,
            width: double.infinity,
            height: 70,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                nombreEstandar.toUpperCase(),
                style: Apptheme.textPrimarySmall, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 2),
             const SizedBox(height: 5),
             Text(nombreCientifico, 
             style: Apptheme.textSecondarySmall, textAlign: TextAlign.center,  overflow: TextOverflow.ellipsis, maxLines: 2),
            ],),
          ) 
      ],
    );
  }
}