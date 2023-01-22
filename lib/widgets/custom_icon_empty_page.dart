import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';

class CustomIconEmptyPage extends StatelessWidget {
  const CustomIconEmptyPage({Key? key, required this.marginTop, this.onPressed}) : super(key: key);

  final double marginTop;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {

   return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            
            children: [
              Icon(Icons.search, size: 60, color: Apptheme.secondary.withOpacity(0.4),),
              const SizedBox(height: 20),
              Text('No se han encontrado plantas que coincidan con la búsqueda', 
              style: Apptheme.textSecondaryMediumLarge, textAlign: TextAlign.center),
               const SizedBox(height: 40),
              TextButton(
                onPressed: onPressed, 
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: Apptheme.primaryClear,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Cargar plantas', style: Apptheme.textGreenMedium),
                )
                )
              ],
          ),
        ),
      ),
    );
  }
}


