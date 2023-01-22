import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greeny_app/services/notifications_service.dart';
import 'package:greeny_app/services/services.dart';
import 'package:greeny_app/share_preferences/preferences.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/custom_app_bar.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class MiPerfilScreen extends StatefulWidget {
   
  const MiPerfilScreen({Key? key}) : super(key: key);

  @override
  State<MiPerfilScreen> createState() => _MiPerfilScreenState();
}

class _MiPerfilScreenState extends State<MiPerfilScreen> {

 @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
     final plantsService = Provider.of<PlantsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil', style: Apptheme.textWhiteLargeButton),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
             width: size.width,
             height: size.height*0.3,
             // color: Colors.amber,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 const ImgProfile(),
                 // const Image(image: AssetImage('assets/avatar-img.jpeg')),
                  Text('Carlos', style: Apptheme.textPrimaryLarge)
               ],
             ),
          ),
          Container(
             width: size.width,
             height: size.height*0.5,
             child: Column(
               children: [
                 Column(
                   children: [
                      MyAccountDataList(descripcionDatos: 'Nombre usuario', misDatos: Preferences.name, icon: Icons.person,
                      onTap: (){
                        print('nombre usuario');
                        
                        CustomAlertDialog().dialogChangeUserName(Platform.isAndroid, context, 'Cambiar nombre', 
                        Preferences.name, (value) {
                          Preferences.name = value;
                          setState(() {});
                          }, 'Aceptar', (){
                            Navigator.pop(context);
                            NotificationsService.showSnackbar('El nombre de usuario se ha actualizado', Apptheme.blue);
                          }, Apptheme.primary, 'Cancelar', () => Navigator.pop(context), Apptheme.black);
      
                       }),
                      MyAccountDataList(descripcionDatos: 'Correo', misDatos: 'carlos@gmail.com', icon: Icons.mail,),
                      MyAccountDataList(descripcionDatos: 'Mis plantas', misDatos: '${plantsService.myPlants.length}', icon: Icons.eco,),
                      MyAccountDataList(descripcionDatos: 'Plantas favoritas', misDatos: '7', icon: Icons.favorite),
                   ],
                 ),
                 Container(
                   margin: const EdgeInsets.symmetric(vertical: 10),
                   child: SwitchListTile.adaptive(
                     secondary: Icon(Icons.notifications, color: Preferences.isNotifications ? Apptheme.primaryMediumClear : Apptheme.secondary.withOpacity(0.5)),
                     title: Text('Desactivar notificaciones', style: Preferences.isNotifications ? Apptheme.textBlackMediumLarge : Apptheme.textSecondaryMediumLarge),
                     value: Preferences.isNotifications, 
                     onChanged: (value){
                        Preferences.notifications = value;
                       // Preferences.notifications = Preferences.notifications;
                        Preferences.isNotifications ? NotificationsService.showSnackbarWithIcon('Notificaciones activadas', Apptheme.blue, Icons.notifications) 
                        : NotificationsService.showSnackbarWithIcon('Notificaciones desactivadas', Apptheme.amberDark, Icons.notifications);
                        setState(() {});
                     }
                    ),
                 ),
                ],
             ),
          )
        ],
      )
    );
  }

 
  
  // ***********************+
  // DIALOG *****************
   // ***********************+
  
}


// *************************************+
// LISTA DE DATOS DE MI CUENTA *********+
// *************************************+
class MyAccountDataList extends StatelessWidget {
  const MyAccountDataList({
    Key? key, required this.descripcionDatos, required this.misDatos, required this.icon, this.onTap,
  }) : super(key: key);

  final String descripcionDatos;
  final String misDatos;
  final IconData icon;
  final Function()? onTap;
  
 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 0),
        ListTile(
          title: Text(misDatos, style: Apptheme.textBlackMediumLarge),
          subtitle: Text(descripcionDatos, style: Apptheme.textSecondaryMedium),
          leading: Icon(icon, color: Apptheme.primaryMediumClear),
          onTap: onTap
        )
      ],
    );
  }
}

// *************************************+
// IMG PROFILE **************************
// *************************************+
class ImgProfile extends StatelessWidget {
  const ImgProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         const CircleAvatar(
          backgroundImage: AssetImage('assets/avatar-img.jpeg'),
          radius: 80,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Apptheme.primary,
              shape: BoxShape.circle
            ),
            child: IconButton(
             icon: const Icon(Icons.camera_alt, color: Colors.white),
             onPressed: (){
               print('Cambiar imagen de perfil');
             }, 
           ),
          )
        ),
      ],
    );
  }
}