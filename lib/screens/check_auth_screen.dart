import 'package:flutter/material.dart';
import 'package:greeny_app/screens/screens.dart';
import 'package:greeny_app/services/services.dart';
import 'package:provider/provider.dart';


class CheckAuthScreen extends StatelessWidget {
   
  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);
    final plantsService = Provider.of<PlantsService>(context);

    return Scaffold(
      body: FutureBuilder(
        future: authService.checkValidToken(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
          
          if(!snapshot.hasData){
            return const Center(child: Text('Espere...')); // ESPERAR
          } 

          if(snapshot.data == false || snapshot.data == null){
              _backToLogin(context); // NO PASAR
              print('El token ha caducado');
           
          }else{
              _goToHome(plantsService, context); // PASAR
          }
         return Container();
        }
      )
    );
  }
  
  // PASAR *****************
  void _goToHome(PlantsService plantsService, BuildContext context) async{
    
       Future.microtask((){
        // Carga las plantas antes de navegar al home
        plantsService.loadPlants(); 
        plantsService.loadMyPlants(); 
        Navigator.pushReplacement(context, PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen(),
            transitionDuration: const Duration(seconds: 0)
           ));
        });
     }
  
  // NO PASAR *****************
  void _backToLogin(BuildContext context) {
    Future.microtask((){
        Navigator.pushReplacement(context, PageRouteBuilder(
           pageBuilder: (_, __, ___) => WelcomeScreen(),
           transitionDuration: const Duration(seconds: 0)
           ));
         });
  }


}