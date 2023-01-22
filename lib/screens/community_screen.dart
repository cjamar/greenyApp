import 'package:flutter/material.dart';
import 'package:greeny_app/widgets/widgets.dart';

import '../themes/themes.dart';


class CommunityScreen extends StatelessWidget {
   
  const CommunityScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar().appBar(context, 'Community'),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
            SizedBox(
              width: size.width,
              height: size.height*0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width*0.5,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Image(image: AssetImage('assets/img-task-acomplished-1.png')),
                    ),
                  ),
                  SizedBox(
                    width: size.width*0.7,
                    child: Column(
                      children: [
                        Text('¡Bienvenido a community!', style: Apptheme.textBlackLarge, textAlign: TextAlign.center),
                        const SizedBox(height: 5),
                        Text('Necesitarás cumplimentar unos pasos para entrar a nuestra comunidad de usuarios. ¿Estás listo?', style: Apptheme.textGreenMedium, textAlign: TextAlign.center),
                      ],
                    ))
                ],
              ),
            ),
            CustomElevatedButton(backgroundColor: Apptheme.primary, textstyle: Apptheme.textWhiteLargeButton, 
            title: 'Entrar', onPressed: ()=> print('Entrando a community'),
           )
         ],
       ),
      );
    }
}