// USUARIO MODEL *********************

import 'package:greeny_app/models/plant.dart';

class User {

  User({
    this.id,
    required this.nombre,
    required this.plantsUser,
    required this.plantsFavorites
  });

  String? id;
  String nombre;
  List<dynamic>plantsUser;
  List<dynamic>plantsFavorites;

  factory User.fromJson(Map<String, dynamic> json) => User(
      nombre: json["nombre"] == null ? null : json["nombre"],
      plantsUser: json["plantsUser"] == null ? [] : (json["plantsUser"] as List<dynamic>).map((plantUser) => plantUser).toList(),
      plantsFavorites: json["plantsFavorites"] == null ? [] : (json["plantsFavorites"] as List<dynamic>).map((plantFavorite) => plantFavorite).toList(),
    );

  Map<String, dynamic> toJson() =>{
    "nombre": nombre == null ? null : nombre,
     "plantsUser": plantsUser == [] ? [] : List<dynamic>.from(plantsUser.map((x) => x)),
     "plantsFavorites": plantsFavorites == null ? [] : List<dynamic>.from(plantsFavorites.map((x) => x)),
  };

  User copy() => User(
    nombre: nombre, 
    plantsUser: plantsUser, 
    plantsFavorites: plantsFavorites
    );

}