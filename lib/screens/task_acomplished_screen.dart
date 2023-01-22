import 'package:flutter/material.dart';
import 'package:greeny_app/widgets/widgets.dart';
import '../themes/themes.dart';



class TaskAcomplishedScreen extends StatelessWidget {
   
  const TaskAcomplishedScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Apptheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: size.width,
              height: size.height*0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                  const Image(image: AssetImage('assets/img-task-acomplished-2.png')), 
                  SizedBox(
                    width: size.width*0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Tarea cumplida', 
                        style: Apptheme.textPrimaryDarkLargeButton, textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        Text('¡No olvides echar un vistazo cada día a tus plantas!', 
                        style: Apptheme.textWhiteLargeButton, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ],
                )
              ),
             CustomElevatedButton(title: 'Volver', backgroundColor: Apptheme.white, 
             textstyle: Apptheme.textPrimaryLargeButton, onPressed: ()=> Navigator.pop(context))
          ],
        ),
      )
    );
  }
}