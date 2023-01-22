import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final uiProvider = Provider.of<UiProvider>(context);
    /* Si pusieramos esta propiedad en un metodo concreto, tendriamos
    que ponerle el listen:false para que no se intentará redibujar y de error */

    final currentIndex = uiProvider.selectedMenuOption;
    
    return BottomNavigationBar(
       currentIndex: currentIndex,
     // elevation: 0,
      iconSize: 20,
      unselectedLabelStyle: Apptheme.textSecondarySmall,
      selectedLabelStyle: Apptheme.textSecondarySmall,
      selectedItemColor: Colors.green,
      type: BottomNavigationBarType.fixed, // Esto nos permite poner mas de 3 items
     // backgroundColor: Colors.black12,

      onTap: (int i) => uiProvider.selectedMenuOption = i,

      items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Buscar'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco_rounded),
            label: 'Mis plantas'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Mis mensajes'
            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'Community'
            ), 
          
      ]
      );
  }
}