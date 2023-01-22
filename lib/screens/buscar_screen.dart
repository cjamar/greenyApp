import 'package:flutter/material.dart';
import 'package:greeny_app/models/plant.dart';
import 'package:greeny_app/providers/ui_provider.dart';
import 'package:greeny_app/screens/screens.dart';
import 'package:diacritic/diacritic.dart';
import 'package:greeny_app/search/search_delegate.dart';
import 'package:greeny_app/services/plants_service.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:async';



class BuscarScreen extends StatefulWidget {
   
  const BuscarScreen({Key? key}) : super(key: key);

  @override
  State<BuscarScreen> createState() => _BuscarScreenState();
}

class _BuscarScreenState extends State<BuscarScreen> {

 // late final plantsService='';
   List<Plant> plants = [];     
   List<Plant> matchPlants = [];
 // List<Plant> plants = [];
  
   
   @override
   void initState() { 
      _accionesIniciales();
     super.initState();
   }

   _accionesIniciales() async{
      plants = await PlantsService().loadPlants();
      print('Plants: ${plants.length}');
     // matchPlants = PlantsService().matchPlants;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
         setPlantList();
    });
    
   }

 @override
  Widget build(BuildContext context) {

   final size = MediaQuery.of(context).size;
   final plantsService = Provider.of<PlantsService>(context);
   Timer? _debounce;
   
   // final plants = plantsService.plants;
  // if(PlantsService().isLoading) return const LoadingScreen(); 

   return Scaffold(
      appBar: CustomAppBar().appBarSearcher(
        context, size, 'Buscar', 
            // CUSTOM SEARCH BAR
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomSearchBar(size: size, 
              onChanged: (value) async {
                
                if(_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 500), (){
                    
                    setState(() {
                       plantsService.matchPlants = plants.where((plant) => removeDiacritics(plant.nombreComun!).toLowerCase().contains(value)).toList();
                    });
                 });

                @override
                void dispose(){
                  _debounce?.cancel();
                  super.dispose();
                }
              }, 
              ),
             ),
             // CATEGORY BUTTONS
            Container(
              child:  CustomCategoryList(size : size, matchPlants: matchPlants, plants: plants),
            ) 
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SEARCHING FORM BUTTON
            CustomFormButton(size: size),
           // GRID PLANTS
           Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomGridPlant1(size: size, plants: plantsService.matchPlants, itemCount: plantsService.matchPlants.length),
             )
          ],
        ),
      )
    );
   }

  void setPlantList() {
    // setState(() {
       matchPlants = plants;
     // plantsService.notifyListeners;
       print('Match plants: ${PlantsService().matchPlants.length}');
   // }); 
  }
}

// ******************************************
// CUSTOM FORM BUTTON ***********************
// ******************************************
class CustomFormButton extends StatelessWidget {
  const CustomFormButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: size.width*0.6,
         child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Apptheme.primary))),
                child: Text('Formulario de búsqueda', style: TextStyle(color: Apptheme.primary, 
                fontFamily: Apptheme.montserrat)),
              ),
              const SizedBox(width: 2),
              Icon(Icons.arrow_forward, color: Apptheme.primary, size: 18)
            ],
          ),
          onPressed: () => print('Acceder a formulario')  /* Navigator.pushNamed(context, 'form') */
          ),
      ),
    );
  }
}

// ******************************************
// CUSTOM CATEGORY LIST *********************
// ******************************************
class CustomCategoryList extends StatelessWidget {
  CustomCategoryList({
    Key? key, required this.size, required this.matchPlants, required this.plants, 
  }) : super(key: key);

 final size;
 List<Plant> matchPlants;
 final List<Plant> plants;
 List<String> categories = ['Todas', 'Interior', 'Exterior', 'Pet friendly', 'Económicas', 'Altas', 'Luz directa', 'Para iniciados', 'Para expertos'];
 
 @override
  Widget build(BuildContext context) {

    final plantsService = Provider.of<PlantsService>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    int selectedIndex = uiProvider.selectedCategoryOption;
   
  return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 0, right: 0),
      height: 32,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          decoration: BoxDecoration(
            border: Border.all(color: Apptheme.primary, width: 0.5),
            color: selectedIndex == index ? Apptheme.primary : Apptheme.white,
            borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton(
            child: Text(categories[index], style: selectedIndex == index ?  Apptheme.textWhiteMedium : Apptheme.textGreenMedium),
            onPressed: (){
              uiProvider.selectedCategoryOption = index;

               switch(categories[index]){
                 case 'Todas': _lookForAllPlants(plantsService);
                        break;
                 case 'Interior' : _lookForInterior(plantsService);
                      break;
                 case 'Exterior' : _lookForExterior(plantsService);
                      break;     
                 case 'Pet friendly': _lookForPetFriendly(plantsService); 
                      break;
                 case 'Económicas': _lookForPrice(plantsService);  
                      break;
                 case 'Altas': _lookForHeight(plantsService);    
                      break;
                 case 'Luz directa': _lookForDirectLight(plantsService);        
               }
             }),
        )
        ),
    );
  }
  
  // FILTER METHODS ***************************
  void _lookForAllPlants(PlantsService plantsService) {
    plantsService.matchPlants = plants;
    plantsService.notifyListeners();
    print('Todas: ${plantsService.matchPlants.length}');
  } 

  void _lookForPetFriendly(PlantsService plantsService) {
   // matchPlants = plants.where((plant) => plant.aptaMascotas!).toList();
    plantsService.matchPlants = plants.where((plant) => plant.aptaMascotas!).toList();
    plantsService.notifyListeners();
    print('Pet friendly: ${plantsService.matchPlants.length}');
  }
  
  void _lookForPrice(PlantsService plantsService) {
     plantsService.matchPlants = plants.where((plant) => plant.precio!<40).toList();
     plantsService.notifyListeners();
     print('Económicas: ${plantsService.matchPlants.length}');
  }
  
  void _lookForInterior(PlantsService plantsService) {
    plantsService.matchPlants = plants.where((plant) => plant.esDeInterior!).toList();
    plantsService.notifyListeners();
    print('Interior: ${plantsService.matchPlants.length}');
  }
  
  void _lookForExterior(PlantsService plantsService) {
     plantsService.matchPlants = plants.where((plant) => !plant.esDeInterior!).toList();
     plantsService.notifyListeners();
     print('Exterior: ${plantsService.matchPlants.length}');
  }
  
  void _lookForHeight(PlantsService plantsService) {
     plantsService.matchPlants = plants.where((plant) => plant.altura == null ? false : plant.altura!>40).toList();
     plantsService.notifyListeners();
     print('Altas: ${plantsService.matchPlants.length}');
  }
  
  void _lookForDirectLight(PlantsService plantsService) {
     plantsService.matchPlants = plants.where((plant) => plant.tipoLuz=='Luz directa').toList();
      plantsService.notifyListeners();
     print('Luz directa: ${plantsService.matchPlants.length}');
   }
  
  
}


// ******************************************
// CUSTOM GRID PLANTS ***********************
// ******************************************
class CustomGridPlant1 extends StatefulWidget {
  const CustomGridPlant1({
    Key? key,
    required this.size,
    required this.plants, required this.itemCount,
  }) : super(key: key);

  
  final Size size;
  final List<Plant> plants;
  final int itemCount;
  
  @override
  State<CustomGridPlant1> createState() => _CustomGridPlant1State();
}

class _CustomGridPlant1State extends State<CustomGridPlant1> {

 final ScrollController _scrollController = ScrollController();

 @override
  void initState() {
    super.initState();
     _scrollController.addListener(() { 
          print('${_scrollController.position.pixels}, ${_scrollController.position.maxScrollExtent}');
      });
  }

 @override
  Widget build(BuildContext context) {

  final plantServices = Provider.of<PlantsService>(context);
  // print('Entro');
    
    return widget.plants.isEmpty ? CustomIconEmptyPage(marginTop: 90, 
    onPressed: () async{
       await plantServices.loadPlants();
    }) 
    : GridView.builder(
       controller: _scrollController,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         childAspectRatio: ((widget.size.width*0.4)/2)/((widget.size.height*0.23)/2),
         ),
      physics: const NeverScrollableScrollPhysics(),  
      shrinkWrap: true,  
      itemCount: widget.itemCount,   
      itemBuilder: (BuildContext context, index){
      
        return GestureDetector(
          onTap: (){
          plantServices.selectedPlant = widget.plants[index].copy(false);
          Navigator.pushNamed(context, 'planta');
           },
          child: SquareCardTest(
            size: widget.size, 
            img: widget.plants[index].imagen ?? 'https://uning.es/wp-content/uploads/2016/08/ef3-placeholder-image.jpg', 
            estandar: widget.plants[index].nombreComun ?? '',
            cientifico: widget.plants[index].nombreCientifico ?? ''
           ),
        );
      }
      );
  }
}

// ******************************************
// ESTRUCTURA CARD EJEMPLO *****************+
// ******************************************
class SquareCardTest extends StatelessWidget {
  const SquareCardTest({
    Key? key,
    required this.size, required this.img, required this.estandar, required this.cientifico,
  }) : super(key: key);

  final Size size;
  final String img;
  final String estandar;
  final String cientifico;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width*0.4,
      height: size.height*0.25,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
           BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 0),
        )]
      ),
      child: CustomCardPlant1(imagen: img, nombreCientifico: cientifico, nombreEstandar: estandar),
    );
  }
}

