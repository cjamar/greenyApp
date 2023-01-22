import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greeny_app/services/notifications_service.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:numberpicker/numberpicker.dart';


class CustomAlertDialog {

  final String title='';
  final String option1='';
  final TextStyle textStyleOption1 =Apptheme.textPrimaryMedium;
  final TextStyle textStyleOption2 =Apptheme.textPrimaryMedium;
 // late final Function()? onPressedOption1;
 // late final Function()? onPressedOption2;
  final Color color1 = Apptheme.black;
  final Color color2 = Apptheme.black;
  late bool isAndroid;
  
  
   dialog(bool isAndroid, BuildContext context, String title, String option1, Color color1,
   String option2, Color color2, Function()? onPressedOption1, Function()? onPressedOption2){
    
   if(isAndroid){
        showDialog(
      context: context, 
      builder: (context){
          return AlertDialog(
            title: Text(title, style: Apptheme.textBlackMediumLarge),
            actions: [
              TextButton(
                onPressed: onPressedOption1, 
                child: Text(option1)
                ),
             TextButton(
               onPressed: onPressedOption2, 
               child: Text(option2)
               ),
            ],
          );
      });
   }else{
     showCupertinoDialog(
      barrierDismissible: true,
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
            title: Text(title, style: Apptheme.textBlackMediumLarge),
            actions: [
              TextButton(
                onPressed:  onPressedOption1, 
                child: Text(option1, style: TextStyle(color: color1))
                ),
             TextButton(
               onPressed: onPressedOption2, 
               child: Text(option2, style: TextStyle(color: color2))
               ),
            ],
        );
      });
   } 
    
  }

  dialogTaskAcomplished(bool isAndroid, BuildContext context, String title, String option1, Color color1, Function()? onPressed){
      
      if(isAndroid){
        showDialog(
      context: context, 
      builder: (context){
          return AlertDialog(
            content: const SizedBox(
              width: 100,
              height: 100,
              child: Image(image: AssetImage('assets/img-carousel3.png')),
            ),
            title: Text(title, style: Apptheme.textBlackMediumLarge),
            actions: [
              TextButton(
                onPressed: onPressed, 
                child: Text(option1, style: TextStyle(color: color1),)
                ),
             ],
          );
      });
   }else{
     showCupertinoDialog(
      barrierDismissible: true,
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
            title: Text(title, style: Apptheme.textBlackMediumLarge),
            actions: [
             TextButton(
               onPressed: onPressed, 
               child: Text(option1, style: TextStyle(color: color1))
               ),
            ],
        );
      });
   } 
  }


  // ****************************
  // ALERT DIALOG AÑADIR TAREA
  // ***************************+
  dialogWithTextfield(bool isAndroid, BuildContext context, String title, String initialValue, 
  Function(String)? onChanged, String option1, Function()? onPressedOption1, Color color1, 
  String option2, Function()? onPressedOption2, Color? color2, Container numberpicker){
    
   String taskName = '';
 // int _currentValue=; 
   
   if(isAndroid){
        showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context){
          return AlertDialog(
            title: Text(title, style: Apptheme.textBlackMediumLarge),
              content: Padding(
                padding: const EdgeInsets.all(10),
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormFieldDialog(hintText: 'Nombre tarea',
                    initialValue: initialValue, 
                    onChanged: onChanged,
                    validator: (value){
                        return value !=null && value.length >=3 && value.length<18 ? null : 'Escribe entre 3 y 18 caracteres';
                     },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: numberpicker
                    )
                   ],
                ),
              ),
              actions: [
                TextButton(
                onPressed: onPressedOption1, 
                child: Text(option1, style: TextStyle(color: color1))
                ),
                TextButton(
                onPressed: onPressedOption2, 
                child: Text(option2, style: TextStyle(color: color2))
                ),
              ],
          );
      });
   }else{
     showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: CupertinoAlertDialog(
            title: Text(title),
              content: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormFieldDialog(hintText: 'Nombre tarea', 
                    initialValue: initialValue,
                    onChanged: onChanged,
                    validator: (value){
                        return value !=null && value.length >=3 && value.length<18 ? null : 'Escribe entre 3 y 18 caracteres';
                     },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: numberpicker
                    )
                  ],
                ),
              ),
              actions: [
               TextButton(
                onPressed: onPressedOption1, 
                child: Text(option1, style: TextStyle(color: color1))
                ),
                TextButton(
                onPressed: onPressedOption2, 
                child: Text(option2, style: TextStyle(color: color2))
                ),
                ],
          ),
        );
      });
     } 
   }


  // ***********************************
  // ALERT DIALOG CAMBIAR NOMBRE USUARIO 
  // ***************************+*******
   dialogChangeUserName(bool isAndroid, BuildContext context, String title, String initialValue, 
  Function(String)? onChanged, String option1, Function()? onPressedOption1, Color color1, 
  String option2, Function()? onPressedOption2, Color? color2){
    
   String taskName = '';
 // int _currentValue=; 
   
   if(isAndroid){
        showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context){
          return AlertDialog(
            title: Text(title, style: Apptheme.textSecondaryMediumLarge),
              content: CustomTextFormFieldDialog(
                    hintText: '',
                    initialValue: initialValue, 
                    onChanged: onChanged,
                    validator: (value){
                        return value !=null && value.length >=3 && value.length<18 ? null : 'Escribe entre 3 y 18 caracteres';
                     },
                    ),
               actions: [
                TextButton(
                onPressed: onPressedOption1, 
                child: Text(option1, style: TextStyle(color: color1))
                ),
                TextButton(
                onPressed: onPressedOption2, 
                child: Text(option2, style: TextStyle(color: color2))
                ),
              ],
          );
      });
   }else{
     showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: CupertinoAlertDialog(
            title: Text(title),
              content: CustomTextFormFieldDialog(
                  hintText: '', 
                  initialValue: initialValue,
                  onChanged: onChanged,
                  validator: (value){
                      return value !=null && value.length >=3 && value.length<18 ? null : 'Escribe entre 3 y 18 caracteres';
                   },
                  ),
               actions: [
               TextButton(
                onPressed: onPressedOption1, 
                child: Text(option1, style: TextStyle(color: color1))
                ),
                TextButton(
                onPressed: onPressedOption2, 
                child: Text(option2, style: TextStyle(color: color2))
                ),
                ],
          ),
        );
      });
     } 
   }

}



