// import 'package:diacritic/diacritic.dart';
// import 'package:flutter/material.dart';
// import 'package:greeny_app/models/models.dart';
// import 'package:greeny_app/screens/screens.dart';
// import 'package:greeny_app/services/plants_service.dart';
// import 'package:greeny_app/widgets/widgets.dart';
// import 'package:provider/provider.dart';



// class PlantSearchDelegate extends SearchDelegate{
  
//   final plants = PlantsService().plants;
//   final scrollController = ScrollController();
//  // final List<String>searchPlants = [];
  
//   @override
//   // TODO: implement searchFieldLabel
//   String? get searchFieldLabel => 'Buscar planta';

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return [
//       IconButton(
//         icon: const Icon(Icons.close),
//         onPressed: () {
//           close(context, null);
//         }
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () {
//           close(context, null);
//         }
//       );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//    final size = MediaQuery.of(context).size;
//     List<Plant> matchPlants = [];

//     searching(matchPlants);

//     return matchPlants.isEmpty ? const CustomIconEmptyPage(marginTop: 0) 
//     :  SafeArea(
//       child: SingleChildScrollView(
//         child: Container(margin: const EdgeInsets.only(top: 50, left: 8, right: 8), 
//         child: CustomGridPlant1(size: size, plants: matchPlants, itemCount: matchPlants.length))
//         ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//      final size = MediaQuery.of(context).size;
//     List<Plant> matchPlants = [];

//     searching(matchPlants);
    
//     return matchPlants.isEmpty ?  const CustomIconEmptyPage(marginTop: 0) 
//     : SafeArea(
//       child: SingleChildScrollView(
//         child: Container(margin: const EdgeInsets.only(top: 50, right: 8, left: 8), 
//         child: CustomGridPlant1(size: size, plants: matchPlants, itemCount: matchPlants.length))
//         ),
//     );
//   }

//   void searching(List<Plant>matchPlants) {
//     for (var p in plants){
//       if(removeDiacritics(p.nombreComun!).toLowerCase().contains(query.toLowerCase()) 
//       || removeDiacritics(p.nombreCientifico!).toLowerCase().contains(query.toLowerCase())){
//         matchPlants.add(p);
//       }
      
//     }
//   }
    

// }

