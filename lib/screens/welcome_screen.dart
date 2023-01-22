import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';



class WelcomeScreen extends StatelessWidget {
   
  const WelcomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
            SizedBox(
              width: size.width,
              height: size.height*0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('assets/logo-greeny.png')),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image(image: AssetImage('assets/img-welcome.png')),
                  ),
                  SizedBox(
                    width: size.width*0.7,
                    child: Text('La app para buscar, cuidar y aprender de tus plantas', style: Apptheme.textBlackLarge))
                ],
              ),
            ),
            CustomElevatedButton(backgroundColor: Apptheme.primary, textstyle: Apptheme.textWhiteLargeButton, 
            title: 'Comenzar', onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
           )
         ],
       ),
    );
  }
}