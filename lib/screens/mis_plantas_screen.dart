import 'package:flutter/material.dart';
import 'package:greeny_app/models/plant.dart';
import 'package:greeny_app/services/services.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MisPlantasScreen extends StatelessWidget {
   
  const MisPlantasScreen({Key? key}) : super(key: key);
  
 @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final plantsService = Provider.of<PlantsService>(context);
    final myplants = plantsService.myPlants;
    final estado='';
    
   return  Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar().appBar(context, 'Mis plantas'),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: myplants.isEmpty ? const CustomEmptyIconMyPlants() 
           : Column(
         children: [
           Container(
             margin: const EdgeInsets.only(top: 25, bottom: 10),
             width: size.width, 
             height: size.height*0.18,
             child: const Image(image: AssetImage('assets/img-myplants-header.png')),
             ),
           ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myplants.length,
              itemBuilder: (context, index){
                 return GestureDetector(
                  child: CardPlant2(
                     size: size, 
                     imagen: myplants[index].imagen ?? 'https://uning.es/wp-content/uploads/2016/08/ef3-placeholder-image.jpg', 
                     title: myplants[index].nombreComun ?? 'Sin nombre', 
                     subtitle: myplants[index].nombreCientifico ?? 'Sin nombre',
                     estado: plantState(_activedTasks(myplants[index]), estado),
                     numTareas: _activedTasks(myplants[index]),
                     ),
                   onTap: (){
                     plantsService.selectedPlant = myplants[index].copy(true);
                     Navigator.pushNamed(context, 'planta');
                    },  
                  );
              }
              ),
         ],
           ),
      )
    );
  }
  
  _activedTasks(Plant plant) {
     int tareaCount=0;
     
     plant.tareas!.forEach((tarea) { 
       tarea.isActivated! ? tareaCount++ : null;
     });

     return tareaCount;
  }
  
  plantState(int numTareas, String estado) {
     if(numTareas > 0){
       if(numTareas > 2){
         estado = 'alarmante';
       }else{
         estado = 'pendiente';
       }
     }else{
       estado = 'controlado';
     }
    
    return estado;
  }
      
 
}

class CustomEmptyIconMyPlants extends StatelessWidget {
  const CustomEmptyIconMyPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width*0.6,
        height: size.height*0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/img-carousel-2.png')),
           // Icon(Icons.eco, color: Apptheme.secondary.withOpacity(0.6), size: 60),
            SizedBox(height: size.height*0.03),
            Text('Todavía no tienes plantas, ¡añáde alguna a tu lista!', 
            style: Apptheme.textSecondaryMediumLarge, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
