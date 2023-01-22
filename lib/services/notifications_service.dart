import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';


class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message, Color backgroundColor){
    
    final snackbar = SnackBar(
      content: Container(
      child: Text(message, style: Apptheme.textWhiteMedium, textAlign: TextAlign.center)),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
       //  margin: const EdgeInsets.all(10)
    );

    messengerKey.currentState!.showSnackBar(snackbar);
  }

  static showSnackbarWithIcon(String message, Color backgroundColor, IconData icon){
    
    final snackbar = SnackBar(
      
      dismissDirection: DismissDirection.up,
      content: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.7)),
          const SizedBox(width: 10),
          Text(message, style: Apptheme.textWhiteMedium)
        ],
      ),
      // child: ListTile(
        
      //   title: Text(message, style: Apptheme.textWhiteMedium, textAlign: TextAlign.center),
      //   leading: Icon(icon, color: Colors.white.withOpacity(0.7)),
      //   )
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
       //  margin: const EdgeInsets.all(10)
    );

    messengerKey.currentState!.showSnackBar(snackbar);
  }

}