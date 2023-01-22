import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:greeny_app/models/models.dart';
import 'package:greeny_app/services/auth_service.dart';
import 'package:greeny_app/services/notifications_service.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:http/http.dart' as http;


class PlantsService extends ChangeNotifier {
  
  final String _baseUrl = 'greeny-app-9eed3-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Plant> plants = [];
  final List<Plant> myPlants = [];
  final List<dynamic> tareas = [];
  late Plant selectedPlant;
  final List<User> usuarios= [];
  
   List<Plant> matchPlants = [];
 // late Tarea selectedTareaPlant;

  final storage = FlutterSecureStorage();
  
  File? newPictureFile;
  bool isLoading = true;
  bool isSaving = false;
  int id=0;

  // PlantsService(){
  //  loadPlants();
  //  loadMyPlants();  
  // }

 // CARGAR TODAS LAS PLANTAS DE LA APP *************
 Future <List<Plant>> loadPlants() async{

    isLoading = true;
    notifyListeners();
    
    plants.clear();
    print('Se ha limpiado la lista de plantas: ${plants.length}');
    
    try{
      final url = Uri.https(_baseUrl, 'plants.json', {'auth': await storage.read(key: 'token') ?? ''});
       final resp = await http.get(url);
       
       // **** RESP DE PRUEBA PARA TESTEAR EL ERROR DE SERVICIO +***
       // final resp = await http.get(Uri.parse('url')); 
      if(resp.statusCode == 200 && resp.body != 'null'){
        final Map<String, dynamic> plantsMap = json.decode(resp.body);

       plantsMap.forEach((key, value) {
        final tempPlant = Plant.fromMap(value);
        tempPlant.id = key;
       plants.add(tempPlant);
       });
      
      matchPlants = plants;  
      isLoading = false;
      notifyListeners();
      }
      if(resp.statusCode == 401){
          print('ERROR EN LA LLAMADA, NO AUTORIZADO');
          AuthService().logOut();
      }
    }catch(e){
       print('ERROR: $e');
       AuthService().logOut();
       NotificationsService.showSnackbar('Error inesperado: La carga parece haber fallado', Apptheme.redDark);
    }

    return plants;
  }

  // CARGAR UNA PLANTA DE MI LISTA
  Future<String?> getPlant(Plant plant) async{

     final url = Uri.https(_baseUrl, 'myplants/${plant.id}.json', {'auth': await storage.read(key: 'token') ?? ''});
     final resp = await http.get(url, headers: {'id': 'plant.id'});
     
     print(resp.body);
     notifyListeners();

     return resp.body;
  }
 

  // AÑADIR A MI LISTA DE PLANTAS ********
  Future<bool> addMyPlant(Plant plant) async{

      try{
        final url = Uri.https(_baseUrl, 'myplants.json', {'auth': await storage.read(key: 'token') ?? ''});
      
        final resp = await http.post(url, body: plant.toJson());
        final decodedData = resp.body;
        
        if(resp.statusCode == 200 && resp.body != 'null'){
          // final Map<String, dynamic> plantsMap = json.decode(resp.body);
          print('BODY: $decodedData');
          print('STATUS CODE: ${resp.statusCode}');
        
          loadMyPlants();
          notifyListeners();
          return true;
        }
        if(resp.statusCode == 401){
          print('ERROR EN LA LLAMADA, NO AUTORIZADO');
          AuthService().logOut();
         }
      }catch(e){
         print('ERROR: $e');
         AuthService().logOut();
         NotificationsService.showSnackbar('Error inesperado: La carga parece haber fallado', Apptheme.redDark);
      }
      
     return false; 
   }

   // MODIFICAR MI PLANTA ********
   Future<bool> updateMyPlant(Plant plant) async{
      isSaving = true;
      notifyListeners();

      try{
        print('ID de planta: ${plant.id}');  
        final url = Uri.https(_baseUrl, 'myplants/${plant.id}.json', {'auth': await storage.read(key: 'token') ?? ''});
        final resp = await http.put(url, body: plant.toJson());
        final decodedData = resp.body;
        // print(decodedData);

           if(resp.statusCode == 200 && resp.body != 'null'){
              final Map<String, dynamic> plantsMap = json.decode(resp.body);
             // Actualizar lista aux de plantas
             //  final index = myPlants.indexWhere((element) => element.id == plant.id);
             //  myPlants[index] = plant;
           // print('DECODED DATA: $decodedData');
            print('STATUS CODE: ${resp.statusCode}');
               
            loadMyPlants();
            isSaving = false;
            notifyListeners();
            return true;
           }
          if(resp.statusCode == 401){
          print('ERROR EN LA LLAMADA, NO AUTORIZADO');
          AuthService().logOut();
         }
      }catch(e){
         print('ERROR: $e');
         AuthService().logOut();
         NotificationsService.showSnackbar('Error inesperado: la llamada parece haber fallado', Apptheme.redDark);
      }
      return false;
   }



   // MODIFICAR MI TAREA




   // BORRAR DE MI LISTA DE PLANTAS ********
  Future<bool> deleteMyPlant(Plant plant) async{
     
      try{
        final url = Uri.https(_baseUrl, 'myplants/${plant.id}.json', {'auth': await storage.read(key: 'token') ?? ''});
        final resp = await http.delete(url, body: plant.toJson());
         print(resp.body);
         print(resp.statusCode);
        
        if(resp.statusCode == 200 && resp.body == 'null'){
          final decodedData = resp.body;
           print('URL: $url');
           print('TOKEN: ${await storage.read(key: 'token')}');
           print('BODY: $resp');
           print('STATUS CODE: ${resp.statusCode}');

        loadMyPlants();
        notifyListeners();
        
        return true;
        }
        if(resp.statusCode == 401){
          print('ERROR EN LA LLAMADA, NO AUTORIZADO');
          AuthService().logOut();
         }
      }catch(e){
        print('ERROR: $e');
        AuthService().logOut();
        NotificationsService.showSnackbar('Error inesperado: la llamada parece haber fallado', Apptheme.redDark);
     }
     
     return false;
    }


  // CARGAR MIS PLANTAS *************
   Future loadMyPlants() async{
      
      isLoading = true;
      notifyListeners();
      myPlants.clear();
      
      try{
        final url = Uri.https(_baseUrl, 'myplants.json', {'auth': await storage.read(key: 'token') ?? ''});
        final resp = await http.get(url);
       
       if(resp.statusCode==200 && resp.body != 'null'){
         final Map<String, dynamic> myPlantsMap = json.decode(resp.body);

       myPlantsMap.forEach((key, value) {
        final tempPlant = Plant.fromMap(value);
        tempPlant.id = key;
        myPlants.add(tempPlant);
       });

        isLoading = false;
        notifyListeners();
      }
     if(resp.statusCode == 401){
          print('ERROR EN LA LLAMADA, NO AUTORIZADO');
          AuthService().logOut();
         }
     }catch(e){
        print('ERROR: $e');
        AuthService().logOut();
        NotificationsService.showSnackbar('Error inesperado: la llamada parece haber fallado', Apptheme.redDark);
      }

      return myPlants;
   }


   // CARGAR IMAGEN CAMARA/GALERIA ******
   void updateSelectedPlantImage(String path) {
      
      selectedPlant.imagen = path;
      newPictureFile = File.fromUri(Uri(path: path));
      notifyListeners();
   }

   Future<String?> uploadImage() async{
      if(newPictureFile == null) return null;

      isSaving = true;
      notifyListeners();

      final url = Uri.parse('https://api.cloudinary.com/v1_1/dwlot3pc4/image/upload?upload_preset=x7hocq62');

      final imageUploadRequest = http.MultipartRequest('POST', url);

      final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);

      imageUploadRequest.files.add(file);

      final streamResponse = await imageUploadRequest.send();
      final resp = await http.Response.fromStream(streamResponse);

      if(resp.statusCode != 200 && resp.statusCode != 201){
        print('Algo salió mal: '+ resp.body);
        return null;
      }
      newPictureFile = null;
      final decodedData = jsonDecode(resp.body);

      isSaving = false;
      notifyListeners();

      return decodedData['secure_url'];
   }
  

   // AÑADIR A MI LISTA DE USUARIOS
  //  Future<String> addUser(User usuario) async{

  //     final url = Uri.https(_baseUrl, 'users.json', {'auth': await storage.read(key: 'token') ?? ''});
      
  //     // mapear la clase usuario
  //     final resp = await http.post(url, body: usuario.toJson());
  //     final decodedData = resp.body;
      
  //     print(decodedData);
  //     notifyListeners();
    
  //    return resp.statusCode.toString(); 
  //  }


   // MAPEO ALTERNATIVO LOAD PLANTS
   // if(plantsMap!=null){
      //    plantsMap.forEach((element){
      //    Plant aux = new Plant.fromMap(element);
      //    plants.add(aux);
      //   });
      // }else{
      //   print('La respuesta es nula');
      // }
  //  print(myPlants);
       //   var myPlantsMap = json.decode(resp.body);
       //    if(myPlantsMap!=null){
       //    myPlantsMap.forEach((element){
       //    Plant aux = new Plant.fromJson(element);
       //    print(element);
       //    myPlants.add(aux);
       //   });
      // }else{
      //   print('La respuesta es nula');
      // }
}