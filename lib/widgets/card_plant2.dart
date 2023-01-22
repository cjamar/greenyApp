import 'package:flutter/material.dart';
import 'package:greeny_app/services/plants_service.dart';
import 'package:greeny_app/themes/themes.dart';


class CardPlant2 extends StatelessWidget {
  const CardPlant2({
    Key? key,
    required this.size, required this.title, required this.subtitle, required this.estado, 
    required this.imagen, required this.numTareas,
  }) : super(key: key);

  final Size size;
  final String title;
  final String subtitle;
  final String estado;
  final String imagen;
  final int numTareas;
  
  
 @override
   Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )]
          ),
          width: size.width,
          height: size.height*0.15,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                width: size.width*0.3,
                height: size.height,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imagen),
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width*0.5,
                          child: Text(title, style: Apptheme.textPrimaryMediumLarge, overflow: TextOverflow.ellipsis)),
                        const SizedBox(height: 2),
                        SizedBox(
                          width: size.width*0.5,
                          child: Text(subtitle, style: Apptheme.textSecondaryMedium, overflow: TextOverflow.ellipsis, maxLines: 2)),
                      ],
                    ),
                   
                    Row(
                      children: [ 
                       Text('ESTADO: ', style: Apptheme.textSecondarySmall,),
                       Text(estado.toUpperCase(), style: _colorEstado(estado))  
                      ],
                    )
                  ],
                ),
              )
            ]),
        ),
        Visibility(
          visible: numTareas>0 ? true : false,
          child: Positioned(
            top:0,
            right: 40,
            child: Container(
              decoration: BoxDecoration(
                color: _colorTareaBadge(numTareas),
                shape: BoxShape.circle),
              width: 30,
              height: 30,
              child: Center(
                child: Text('$numTareas', style: TextStyle(color: Apptheme.white , fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ),
        ),
      ],
    );
  }

  _colorEstado(String estado) {
     TextStyle? textStyle;
     
     switch(estado){
       case 'controlado':
       textStyle = Apptheme.textPrimarySmall;
          break;
       case 'pendiente':
       textStyle = Apptheme.textAmberSmall; 
          break;
       case 'alarmante':
       textStyle = Apptheme.textRedSmall; 
          break; 
       default:
         'Sin estado';     
     }
    
    return textStyle;
  }

  _colorTareaBadge(int numTareas) {
     Color color;
      
     if(numTareas>0){
       if(numTareas>2){
          color= Apptheme.red;
       }else{
         color= Apptheme.amber;
       }
     }else{
       color=Apptheme.primary;
     }
  return color;  
}

 

  

}