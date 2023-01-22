import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greeny_app/services/services.dart';

import 'package:greeny_app/themes/themes.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: ListView(
          children: [
           const DrawerHeader(
             child: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar-img.jpeg'),
                radius: 15,
              ),
              ),
            ListTile(
              title:  Text('Carlos', style: Apptheme.textPrimaryLargeButton, textAlign: TextAlign.center),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Apptheme.primary), 
              title:  Text('Mi perfil', style: Apptheme.textPrimaryMedium),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, 'miPerfil');
              }
            ), 
            const Divider(),
             ListTile(
              leading: Icon(Icons.star, color: Apptheme.primary), 
              title: Text('Favoritos', style: Apptheme.textPrimaryMedium),
              onTap: (){},
            ),
            const Divider(),
             ListTile(
              leading: Icon(Icons.settings, color: Apptheme.primary), 
              title: Text('Ajustes', style: Apptheme.textPrimaryMedium),
              onTap: (){},
            ),
            const Divider(),
             ListTile(
              leading: Icon(Icons.logout, color: Apptheme.primary), 
              title: Text('Cerrar sesión', style: Apptheme.textPrimaryMedium),
              onTap: (){
                Navigator.pop(context);
                authService.logOut();
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        ),
      )
    );
  }
}