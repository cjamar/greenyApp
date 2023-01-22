// import 'dart:html';

import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greeny_app/providers/ui_provider.dart';
import 'package:greeny_app/widgets/custom_alert_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greeny_app/screens/screens.dart';
import 'package:greeny_app/services/services.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';


 

class PlantaScreen extends StatelessWidget {
   
  PlantaScreen({Key? key, this.img}) : super(key: key);

  final String? img;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final plantsService = Provider.of<PlantsService>(context);
    final authService = Provider.of<AuthService>(context);
    final plants = plantsService.plants;
   // final myPlants = plantsService.myPlants;
    final tareas = plantsService.tareas;
    final plant = plantsService.selectedPlant;
    final bool isAddedPLant = plantsService.selectedPlant.isAdded!;
   
    return SafeArea(
      child: Scaffold(
       // appBar: CustomAppBar().appBar(context, ''),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // IMG PLANTA -------------------------
              Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: SizedBox(
                       width: size.width,
                       height: size.height*0.5,
                       child: ClipRRect(
                         borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                         child: Stack(
                           children: [
                            plantsService.isSaving ? Center(child: CircularProgressIndicator(color: Apptheme.primary)) 
                             : SizedBox(
                               height: size.height*0.5,
                               width: size.width,
                               child: _getImage(img, plant)
                               ),
                             // DARK GRADIENT IMG PLANTA -------
                            //  _GradientLayerPlant(size: size, bottom: 40),
                              _GradientLayerPlant(size: size, top: 0),
                           ],
                         ),
                       ),
                    ),
                  ),
                  // ARROW BACK ICON -----
                  Positioned(
                    top: 30, left: 20,
                    child: IconButton(
                    onPressed: (() => Navigator.pop(context)),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 30,)
                     ),
                    ),
                  // CAMERA ICON ------
                  Visibility(
                    visible: isAddedPLant,
                    child: Positioned(
                      top: 30,
                      right: 20,
                      child: IconButton(
                        onPressed: () async{
                          Platform.isAndroid ? _showAlertAndroid(context, plantsService, plant, 'Elige acceso', 'Cámara', 'Galería') 
                          : _showAlertIos(context, plantsService, plant, 'Elige acceso', 'Cámara', 'Galería');
                        }, 
                        icon: const Icon(Icons.camera_alt, size: 30, color: Colors.white))
                      ),
                  ),
                ],
              ),
                     Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(plant.nombreComun ?? '', style: Apptheme.textPrimaryLarge, textAlign: TextAlign.center)
              ),
              // LISTA DE TAREAS ----------------------
              Visibility(
                visible: isAddedPLant,
                child: _ListaTareas(size: size)
                ),
              // FICHA PLANTA -------------------
              Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                   plant.nombreCientifico != null ? TextSheetColumn(size: size, caracteristicas: plant.nombreCientifico ?? '', descripcion: 'Nombre cientifico') : Container(),
                   plant.origen !=null ? TextSheetColumn(size: size, caracteristicas: plant.origen ?? '', descripcion: 'Origen') : Container(),
                   plant.tipoLuz !=null ? TextSheetColumn(size: size, caracteristicas: plant.tipoLuz ?? '', descripcion: 'Luz recomendable') : Container(),
                   plant.cicloRiegoGeneral !=null ? TextSheetColumn(size: size, caracteristicas: 'Regar cada '+plant.cicloRiegoGeneral.toString()+' dias', descripcion: 'Ciclo de riego') : Container(),
                   plant.beneficios !=null ? TextSheetColumn(size: size, caracteristicas: plant.beneficios ?? '', descripcion: 'Beneficios') : Container(),
                   plant.consejos !=null ? TextSheetColumn(size: size, caracteristicas: plant.consejos ?? '', descripcion: 'Consejos') : Container(),
                   ]
                )
              ),
             // ICONOS FICHA PLANTA -------------------
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
               // color: Colors.yellow,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Column(                 
                       children: [
                            plant.tipoLuz != null ? IconsSheetColumn(size: size, faIcon: FontAwesomeIcons.sunPlantWilt, caracteristica: plantsService.selectedPlant.tipoLuz ?? '') : Container(),
                            plant.esDeInterior != null ? IconsSheetColumn(size: size, faIcon: FontAwesomeIcons.house, caracteristica: plant.esDeInterior! ? 'Es de interior' : 'No es de interior') : Container(),
                            plant.aptaMascotas != null ? IconsSheetColumn(size: size, faIcon: FontAwesomeIcons.cat, caracteristica: plant.aptaMascotas! ? 'Es apta para mascotas' : 'No es apta para mascotas') : Container(),
                            plant.nivelHumedad != null ? IconsSheetColumn(size: size, faIcon: FontAwesomeIcons.droplet, caracteristica: plant.nivelHumedad ?? '') : Container()
                        ],
                      ),
                      Column(
                      //  mainAxisSize: MainAxisSize.min,
                        children: [
                           plant.tipoRiego !=null ? IconsSheetColumn(size: size, faIcon: FontAwesomeIcons.bottleWater, caracteristica: plant.tipoRiego ?? '') : Container(),
                           plant.tamanoMaceta !=null ? IconsSheetColumn(size: size, faIcon: FontAwesomeIcons.leaf, caracteristica: plant.tamanoMaceta ?? '') : Container(),
                           plant.altura !=null ? IconsSheetColumn(size: size, faIcon: FontAwesomeIcons.plantWilt, caracteristica: plant.altura.toString()+'cm altura') : Container(),
                           plant.precio !=null ? IconsSheetColumn(size: size, faIcon: FontAwesomeIcons.euroSign, caracteristica: plant.precio.toString()+'€') : Container()
                        ],
                      )
                    ]  
                  ),
                ),
              ),
              // CONTENEDOR ESPACIO DEBAJO DE LOS ICONOS PARA QUE EL FAB NO LOS TAPE
              Visibility( 
                visible: !isAddedPLant,
                child: Container(
                  width: size.width,
                  height: size.height*0.08,
                ),
              ),
              // MANUAL PLANTA BUTTON --------------
              Visibility(
                visible: isAddedPLant,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomElevatedButton2(size: size, backgroundColor: Apptheme.white, 
                      icon: Icons.file_open_outlined, color: Apptheme.primary,
                       title: 'Acceder al manual', textstyle: Apptheme.textPrimaryLargeButton, 
                       onPressed: (){
                         // final url = plant.manualUrl;
                         print('Acceder al manual');
                         final ruta = MaterialPageRoute(builder: (context)=> ManualScreen(manual: plant.manualUrl));
                         Navigator.push(context, ruta);
                       },
                       ),
                ),
              ),
              // DELETE PLANT BUTTON ---------------
              Visibility(
                visible: isAddedPLant,
                child: Container(
                  // width: size.width*0.35,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextButton(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      // decoration: BoxDecoration(
                      //    color: Apptheme.red.withOpacity(0.1),
                      //    borderRadius: BorderRadius.circular(20),
                      // ),
                      child: Text('Eliminar planta', style: Apptheme.textRedMediumLargeButton, textAlign: TextAlign.center)),
                    onPressed: () async{
                      Platform.isAndroid ? _showAlertAndroid(context, plantsService, plant, '¿Deseas eliminar esta planta?', 'Eliminar', 'Cancelar') : 
                      _showAlertIos(context, plantsService, plant, '¿Deseas eliminar esta planta?', 'Eliminar', 'Cancelar');
                     },
                  ),
                ),
              ),
              
              ]  
            ),
        ),
        floatingActionButton: Visibility(
          visible: !isAddedPLant,
           child: CustomFAB(
            onPressed: (){
              Platform.isAndroid ? _showAlertAndroid(context, plantsService, plant, '¿Deseas añadir esta planta a tu lista?', 'Añadir', 'Cancelar') : 
              _showAlertIos(context, plantsService, plant, '¿Deseas añadir esta planta a tu lista?', 'Añadir', 'Cancelar');
             }
          ),
        ),
        // Conectarlo el botom navigation bar con las demás paginas (ahora mismo no funciona)
       // bottomNavigationBar: CustomBottomNavBar(),
       ),
    );
  }

  Widget _getImage(String? img, Plant plant){

      if(plant.imagen == null){
        return const Image(image: AssetImage('assets/placeholder-img.jpg'), 
                     fit: BoxFit.cover,);
      }               

      if(plant.imagen!.startsWith('http')){
        return FadeInImage(
        placeholder: const AssetImage('assets/placeholder-img.jpg'),
        image: NetworkImage(plant.imagen ?? 'https://uning.es/wp-content/uploads/2016/08/ef3-placeholder-image.jpg'),
         fit: BoxFit.cover,
         );
      }   

      return Container(
        color: Colors.red,
        child: Image.file(
            File(plant.imagen!),
            fit: BoxFit.cover,
        ),
      );                  
                             
  } 
  
  void cameraAccess(PlantsService plantsService, Plant plant, ImageSource acceso) async{
       
        final picker = new ImagePicker();

        final XFile? image = await picker.pickImage(
        source: acceso,
        imageQuality: 100
        );

        if (image == null){
        print('No seleccionó nada');
        return;
        }

        print('Tenemos imagen: ${image.path}');
        plantsService.updateSelectedPlantImage(image.path);
        
        final String? imageUrl = await plantsService.uploadImage();
        print(imageUrl);

        plantsService.updateMyPlant(plant);
        if(imageUrl != null) plant.imagen = imageUrl;

        NotificationsService.showSnackbar('Se ha modificado la imagen a ${plant.nombreComun}', Apptheme.blue);
      }
      
       // SHOW ALERT DIALOG ANDROID **********************************************
       void _showAlertAndroid(BuildContext context, PlantsService plantsService, Plant plant, String title, String option1, String option2) {
          showDialog(
            barrierDismissible: true,
            context: context, 
            builder: (context){
                return AlertDialog(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  title: Text(title),
                 actions: [
                    TextButton(
                      onPressed: () {
                        switch(option1){
                          case 'Cámara': cameraAccess(plantsService, plant, ImageSource.camera);
                                break;
                          case 'Eliminar': _deletePlant(plantsService, plant, context);
                                break;
                          case 'Añadir' : _addPlant(plantsService, plant, context);   
                                break; 
                          default: 'No se seleccionó ninguna opción';   
                        }
                        Navigator.pop(context);
                      }, 
                      child: Text(option1)
                      ),
                    TextButton(
                      onPressed: (){
                        switch(option2){
                          case 'Galería': cameraAccess(plantsService, plant, ImageSource.gallery);
                                break;
                          case 'Cancelar': null;
                                break;
                          default: 'No se seleccionó ninguna opción';   
                        }
                        Navigator.pop(context);
                      }, 
                      child: Text(option2)
                      )  
                  ],
                );
            });
           
        }
        // ********************************************************************
        // SHOW ALERT DIALOG IOS **********************************************
        // ********************************************************************
        void _showAlertIos(BuildContext context, PlantsService plantsService, Plant plant, String title, String option1, String option2){
          showCupertinoDialog(
            barrierDismissible: true,
            context: context,
             builder: (context){
               return CupertinoAlertDialog(
                  title: Text(title),
                  actions: [
                    TextButton(
                      onPressed: () {
                        switch(option1){
                          case 'Cámara': cameraAccess(plantsService, plant, ImageSource.camera);
                                break;
                          case 'Eliminar': _deletePlant(plantsService, plant, context);
                                break;
                          case 'Añadir' : _addPlant(plantsService, plant, context);   
                                break; 
                          default: 'No se seleccionó ninguna opción';   
                        }
                        Navigator.pop(context);
                      }, 
                      child: Text(option1)
                      ),
                    TextButton(
                      onPressed: (){
                        switch(option2){
                          case 'Galería': cameraAccess(plantsService, plant, ImageSource.gallery);
                                break;
                          case 'Cancelar': null;
                                break;
                          default: 'No se seleccionó ninguna opción';   
                        }
                        Navigator.pop(context);
                      }, 
                      child: Text(option2)
                      )  
                  ],
               );
             });
        }
        
           // DELETE PLANT METHOD ********************
          void _deletePlant(PlantsService plantsService, Plant plant, BuildContext context) async{
             
              Navigator.pop(context);
              await plantsService.deleteMyPlant(plant).then((value) {
                  // NotificationsService.showSnackbar(plant.nombreComun!+' se ha eliminado de tu lista', Apptheme.redDark);
                  if(value){
                     NotificationsService.showSnackbar(plant.nombreComun!+' se ha eliminado de tu lista', Apptheme.redDark);
                  }else{
                     NotificationsService.showSnackbar('Ha ocurrido un error al borrar, reinicie la app', Apptheme.amberDark);
                  }
              });
           }
          
          // ADD PLANT METHOD ********************
            void _addPlant(PlantsService plantsService, Plant plant, BuildContext context) async{
              
              bool existe=false;

             plantsService.myPlants.forEach((element) async{
               if( element.nombreComun == plant.nombreComun){
                  existe=true;
                 }
             });

             if(existe){
                 NotificationsService.showSnackbar('¡Esta planta ya está en tu lista!', Apptheme.amberDark);
             }else{
                 Navigator.pop(context);
                await plantsService.addMyPlant(plant).then((value) {
                  if(value){
                      NotificationsService.showSnackbar(plant.nombreComun! +' se ha añadido a tu lista' , Apptheme.blue);
                  }else{
                    NotificationsService.showSnackbar('Hubo un error al añadir, reinicie la app' , Apptheme.amberDark);
                  }
                 });
              }
           }


}

// *************************************+
// GRADIENT IMG LAYER PLANT *************
// *************************************+
class _GradientLayerPlant extends StatelessWidget {
  const _GradientLayerPlant({
    Key? key,
    required this.size, this.bottom, this.top,
  }) : super(key: key);

  final Size size;
  final double? bottom;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      top: top,
      child: Container(
         width: size.width,
         height: size.height*0.15,
         decoration: BoxDecoration(
         gradient: LinearGradient(
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter,
         colors: [Colors.transparent, Colors.black.withOpacity(0.5)]                        
       )
      ),
     ),
   );
  }
}


// ***************************************
// LISTA TAREAS **************************
// ***************************************
class _ListaTareas extends StatefulWidget {
  const _ListaTareas({
    Key? key,
    required this.size, this.titulo, this.diasRetraso,
  }) : super(key: key);

  final Size size;
  // final int? numTareas;
  final String? titulo;
  final int? diasRetraso;

  @override
  State<_ListaTareas> createState() => _ListaTareasState();
}

class _ListaTareasState extends State<_ListaTareas> {

   int _currentValue=0;

  @override
  Widget build(BuildContext context) {

     String _taskName ='';
     final uiProvider = Provider.of<UiProvider>(context);
     final plantsService = Provider.of<PlantsService>(context);
     final tareas = plantsService.tareas;
     final plant = plantsService.selectedPlant;
    
    return SizedBox(
      width: widget.size.width,
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: plant.tareas!.length,
              itemBuilder: (context, index){
               return InkWell(
                 onTap: (){
                   _udpdateTask(context, plant, index, plantsService);
                 },
                 child: CustomTaskCard(size: widget.size, plant: plant, plantsService: plantsService, index: index),
               );
              }),
              const SizedBox(height: 5),
              InkWell(
                onTap: () => _addTask(context, plant, plantsService, widget.size, _taskName) ,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: widget.size.width,
                  height: widget.size.height*0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Apptheme.primary, width: 0.5),
                  ),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Apptheme.primary, size: 20),
                      const SizedBox(width: 10),
                      Text('Añadir una tarea', style: Apptheme.textGreenMedium),
                    ],
                  )),
                ),
              )
        ],
      ),
    );


  }
   // CUMPLIR TAREA
  // ***************************************
  void _udpdateTask(BuildContext context, Plant plant, int index, PlantsService plantsService) {
      
      if (plant.tareas![index].isActivated!){
        CustomAlertDialog().dialog(Platform.isAndroid, context, '${plant.tareas![index].titulo}', 
          'Cumplir tarea', Apptheme.primary, 'Cancelar', Apptheme.secondaryDark, 
         (){
            print('Tarea: ${plant.tareas![index].titulo}');
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, 'taskAcomplished');
         
            plant.tareas![index].isActivated = false;
            plant.tareas![index].isAcomplished = true;

          plantsService.updateMyPlant(plant).then((value){
             if(!value){
               NotificationsService.showSnackbar('Ha ocurrido un error al modificar, reinicie la app', Apptheme.amberDark);
           }
         }); 
       } , 
      () => Navigator.pop(context));

      }else{
          return;
      }
    }

      // ADD TAREA
     // *************************************
     _addTask(BuildContext context, Plant plant, PlantsService plantsService, Size size, String _taskName) {
       
       CustomAlertDialog().dialogWithTextfield(Platform.isAndroid, context, 
       'Nombra esta tarea', 
       _taskName,
       (value){
          _taskName = value;
       },
       'Añadir', 
       () async{
          if(_taskName.length<3 || _taskName.length>18 || _currentValue<1) {
             return;
          }else {
             String capitalizeTaskName = '${_taskName[0].toUpperCase()}${_taskName.substring(1).toLowerCase()}';
             Tarea newTask = new Tarea(titulo: capitalizeTaskName, diasRetraso: _currentValue, isAcomplished: false, isActivated: false);
             print(capitalizeTaskName);
             plant.tareas!.add(newTask);
             await plantsService.updateMyPlant(plant);
             Navigator.pop(context);
             NotificationsService.showSnackbar('${capitalizeTaskName} se ha añadido a la lista de tareas', Apptheme.blue);
          }
       }, 
       Apptheme.primary, 
       'Cancelar',
       () => Navigator.pop(context), 
       Apptheme.redDark,
       Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
             children: [
             Text('Ciclo de riego (en días)', style: Apptheme.textSecondaryMediumLarge),
             StatefulBuilder(
               builder: (context, setState) {
                 return NumberPicker(
                   axis: Axis.horizontal,
                   value: _currentValue,
                   maxValue: 30,
                   minValue: 0,
                   itemWidth: 40,
                   selectedTextStyle: Apptheme.textPrimaryLarge,
                   textStyle: Apptheme.textPrimaryMedium,
                   onChanged: (value){
                    // print('VALUE: $value');
                    // print('CURRENT VALUE: $_currentValue');
                      setState(() {
                         _currentValue=value;
                     });
                    // print('CURRENT VALUE2: $_currentValue');
                   },
                  );
               }
             )
            ],
         ),
       ), 
    );
  }
}

// ******************************************
// TAREA CARD WIDGET ************************
// ******************************************
class CustomTaskCard extends StatefulWidget {
  const CustomTaskCard({
    Key? key,
    required this.size,
    required this.plant,
    required this.plantsService, 
    required this.index,
  }) : super(key: key);

  final Size size;
  final Plant plant;
  final PlantsService plantsService;
  final int index;

  @override
  State<CustomTaskCard> createState() => _CustomTaskCardState();
}

class _CustomTaskCardState extends State<CustomTaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
       padding: const EdgeInsets.only(left: 10, right: 5),
       width: widget.size.width,
       height: widget.size.height*0.1,
       decoration: BoxDecoration(
         color: Apptheme.white,
         border: Border(left: BorderSide(color: widget.plant.tareas![widget.index].isActivated! ? Apptheme.amber 
          : widget.plant.tareas![widget.index].isAcomplished! ? Apptheme.secondary.withOpacity(0.5) : Colors.transparent, width: 3)),
         boxShadow: [
           BoxShadow(
             offset: const Offset(0, 1),
             color: (widget.plant.tareas![widget.index].isActivated!) ? Apptheme.secondary.withOpacity(0.3) 
              : (widget.plant.tareas![widget.index].isAcomplished!) ? Apptheme.secondary.withOpacity(0.3) : Apptheme.secondary.withOpacity(0),
             blurRadius: 5,
             spreadRadius: 3
             )
           ]
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           SizedBox(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(4),
                   border: Border.all(color: widget.plant.tareas![widget.index].isActivated! ? Colors.transparent 
                    : Apptheme.secondary, width: 0.5),
                   color: widget.plant.tareas![widget.index].isActivated! ? Apptheme.amberClear : Colors.transparent
                    ),
                   child: Text(widget.plant.tareas![widget.index].titulo!, overflow: TextOverflow.ellipsis, maxLines: 1,
                   style: widget.plant.tareas![widget.index].isActivated! ? Apptheme.textAmberMedium : Apptheme.textSecondaryMedium),
                   ),
                   const SizedBox(width: 10),
                   Text(
                     (widget.plant.tareas![widget.index].isActivated!) ? 'Cumplir tarea' /* 'Quedan ${widget.plant.cicloRiegoGeneral} dias' */ 
                   : (widget.plant.tareas![widget.index].isAcomplished!) ? 'Quedan ${widget.plant.tareas![widget.index].diasRetraso!} dias' 
                   : 'Tarea desactivada', 
                   style: Apptheme.textSecondaryMedium, overflow: TextOverflow.ellipsis, maxLines: 1,),
                ],
              ),
           ),
           // SETTINGS TASK BUTTON
           IconButton(
             icon: Icon(Icons.more_vert, color: Apptheme.secondary),
             onPressed: () async{
                 _showModalBottomSheet(context, widget.plant, widget.plantsService, widget.index);
              } 
           )
         ],
       )
     );
  }

  // MODAL BOTTOM SHEET TASK OPTIONS ***********
  void _showModalBottomSheet(BuildContext context, Plant plant, PlantsService plantsService, int index) {
         print('Opciones tarea ${widget.plant.tareas![widget.index].titulo!}');
         bool activada = widget.plant.tareas![widget.index].isActivated!;
         bool cumplida = widget.plant.tareas![widget.index].isAcomplished!;

         showBottomSheet(
           elevation: 20,
           enableDrag: true,
           backgroundColor: Colors.white,
           context: context, 
           builder: (context){
             return Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                  ListTile(
                    leading: Icon(Icons.close, color: Apptheme.secondary),
                    title: Text('Cancelar', style: Apptheme.textSecondaryMediumLarge),
                    onTap: () {
                       Navigator.pop(context);
                    } ,
                  ),
                  const Divider(),
                 ListTile(
                    leading: Icon(activada || cumplida ? Icons.power_off : Icons.power, color: Apptheme.secondary),
                    title: Text(activada || cumplida ? 'Desactivar' : 'Activar', style: Apptheme.textSecondaryMediumLarge),
                    onTap: () async{
                       Navigator.pop(context);
                       activada || cumplida ? widget.plant.tareas![widget.index].isActivated = false : widget.plant.tareas![widget.index].isActivated = true;
                       cumplida ?  widget.plant.tareas![widget.index].isAcomplished = false : widget.plant.tareas![widget.index].isAcomplished = true;
                       await widget.plantsService.updateMyPlant(widget.plant);
                       print(activada || cumplida ? 'Tarea desactivada' : 'Tarea activada');
                      // NotificationsService.showSnackbar(activada ? 'Tarea desactivada' : 'Tarea activada', Apptheme.blue);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.settings, color: Apptheme.secondary),
                    title: Text('Configurar', style: Apptheme.textSecondaryMediumLarge),
                    onTap: (){
                       _configurarTarea(context, plant, plantsService, index);
                       // Navigator.pop(context);
                       print('Configurar tarea');
                    } ,
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.delete, color: Apptheme.red),
                    title: Text('Eliminar', style: Apptheme.textRedMediumLargeButton),
                    onTap: () async{
                     plant.tareas![index].titulo == 'Regar' 
                     ? NotificationsService.showSnackbar('¡No puedes borrar una tarea original!', Apptheme.amberDark)
                     : await CustomAlertDialog().dialog(Platform.isAndroid, context, 'Tu tarea se eliminará', 'Eliminar', Apptheme.red, 'Cancelar', Apptheme.secondaryDark, 
                      (){
                        print('Eliminar tarea');
                           Navigator.pop(context);
                           if(widget.plant.tareas![widget.index].titulo != null){
                           widget.plant.tareas!.remove(widget.plant.tareas![widget.index]);
                           widget.plantsService.updateMyPlant(widget.plant);
                           NotificationsService.showSnackbar('La tarea se ha eliminado', Apptheme.redDark);
                        }else{
                          print('Ocurrió un error al eliminar la tarea');
                           NotificationsService.showSnackbar('Ha ocurrido un error', Apptheme.amberDark);
                         }
                      }, 
                      () => Navigator.pop(context)
                     );
                    } ,
                  )
               ],
             );
           }
       );
         
    }
      // CONFIGURAR TAREA
      void _configurarTarea(BuildContext context, Plant plant, PlantsService plantsService, int index) {

        String _taskName = plant.tareas![index].titulo!;
        int _currentValue = plant.tareas![index].diasRetraso!;

         plant.tareas![index].titulo == 'Regar' ? 
         NotificationsService.showSnackbar('Vas a modificar una tarea original', Apptheme.amberDark)
         : null;

        CustomAlertDialog().dialogWithTextfield(Platform.isAndroid, context, 
         plant.tareas![index].titulo == 'Regar' ? 'Configurar (no puedes modificar el nombre de esta tarea)' : 'Configura esta tarea', 
       _taskName,
       (value){
          _taskName = plant.tareas![index].titulo == 'Regar' ? 'Regar' : value;
       },
       
       'Actualizar', 
       () async{
          if(_taskName.length<3 || _taskName.length>18 || _currentValue<1) {
             return;
          }else {
             String capitalizeTaskName = '${_taskName[0].toUpperCase()}${_taskName.substring(1).toLowerCase()}';
             Tarea newTask = new Tarea(titulo: capitalizeTaskName, diasRetraso: _currentValue, 
             isAcomplished: plant.tareas![index].isActivated, isActivated: plant.tareas![index].isActivated);
             
             plant.tareas![index] = newTask;
             await plantsService.updateMyPlant(plant);
             Navigator.pop(context);
             NotificationsService.showSnackbar('${capitalizeTaskName} se ha actualizado', Apptheme.blue);
             
          }
       }, 
       Apptheme.primary, 
       'Cancelar',
       () => Navigator.pop(context), 
       Apptheme.redDark,
       Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
             children: [
             Text('Ciclo periódico (en días)', style: Apptheme.textSecondaryMediumLarge),
             StatefulBuilder(
               builder: (context, setState) {
                 return NumberPicker(
                   axis: Axis.horizontal,
                   value: _currentValue,
                   maxValue: 30,
                   minValue: 0,
                   itemWidth: 40,
                   selectedTextStyle: Apptheme.textPrimaryLarge,
                   textStyle: Apptheme.textPrimaryMedium,
                   onChanged: (value){
                    // print('VALUE: $value');
                    // print('CURRENT VALUE: $_currentValue');
                      setState(() {
                         _currentValue=value;
                     });
                    // print('CURRENT VALUE2: $_currentValue');
                   },
                  );
               }
             )
            ],
         ),
       ), 
    );
      }


}


// *****************************************
// CUSTOM CLIPPER (PLANT IMAGE) ************
// *****************************************
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-80);
    path.quadraticBezierTo(size.width*0.5, size.height, size.width, size.height-80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
     return false;
  }
}


// *******************************************
// ICONS SHEET COLUMN *************************
// ******************************************
class IconsSheetColumn extends StatelessWidget {
  const IconsSheetColumn({
    Key? key,
    required this.size, this.icon, required this.caracteristica, this.faIcon,
  }) : super(key: key);

  final Size size;
  final IconData? icon;
  final IconData? faIcon;
  final String caracteristica;
  
 @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
       children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: size.width*0.4,
             child: Row(
             children: [
                Stack(children: [
                 Icon(icon, color: Apptheme.secondary),
                 FaIcon(faIcon, color: Apptheme.primaryMediumClear),
                 ]),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(caracteristica, style: Apptheme.textBlackSmall, overflow: TextOverflow.ellipsis, maxLines: 4)
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// ******************************************
// TEXT SHEET COLUMN ************************
// ******************************************
class TextSheetColumn extends StatelessWidget {
  const TextSheetColumn({
    Key? key,
    required this.size, required this.caracteristicas, required this.descripcion,
  }) : super(key: key);

  final Size size;
  final String caracteristicas;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.center, 
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Divider(),
        Text(descripcion, style: Apptheme.textSecondaryMedium, overflow: TextOverflow.ellipsis, maxLines: 1),
        Text(caracteristicas, style: Apptheme.textPrimaryMedium),
       ],
    );
  }
}



 