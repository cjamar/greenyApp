// To parse this JSON data, do
//
//     final plant = plantFromMap(jsonString);

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:greeny_app/models/models.dart';

class Plant {
    Plant({
       this.isAdded,
       this.id,
       this.imagen,
       this.nombreComun,
       this.nombreCientifico,
       this.estado,
      // required this.tarea, // ***** CLASE TAREA ******+
       this.tareas, // **** ARRRAY DE TAREAS ****
       // this.likes,
      // this.descripcion,
       this.origen,
       this.tipoLuz,
       this.temperaturaMinima,
       this.temperaturaMaxima,
       this.altura,
       this.tamanoMaceta,
       this.tipoRiego,
       this.nivelHumedad,
       this.riegoFrecuente,
       this.aptaMascotas,
       this.esDeInterior,
       this.ubicacionCasa,
       this.cicloRiegoGeneral,
       this.cicloRiegoVerano,
       this.cicloRiegoOtono,
       this.cicloRiegoInvierno,
       this.cicloRiegoPrimavera,
       this.frecuenciaAbono,
       this.frecuenciaFertilizante,
       this.nivelDificultad,
       this.expansion,
       this.epocaFlor,
       this.seCosecha,
       this.medidaIdealFruto,
       this.precio,
       this.manualUrl,
       this.consejos,
       this.beneficios,
    });

    String? id;
    bool? isAdded;
    // *************
    String? imagen;
    String? nombreComun;
    String? nombreCientifico;
    String? estado;
   // Tarea? tarea; // ***** TAREA ******
    List<Tarea>? tareas; // ***** ARRAY DE TAREAS ******
   // List<dynamic>? likes;
   // String? descripcion;
    String? origen;
    String? tipoLuz;
    double? temperaturaMinima;
    double? temperaturaMaxima;
    double? altura;
    String? tamanoMaceta;
    String? tipoRiego;
    String? nivelHumedad;
    bool? riegoFrecuente;
    bool? aptaMascotas;
    bool? esDeInterior;
    String? ubicacionCasa;
    int? cicloRiegoGeneral;
    int? cicloRiegoVerano;
    int? cicloRiegoOtono;
    int? cicloRiegoInvierno;
    int? cicloRiegoPrimavera;
    int? frecuenciaAbono;
    int? frecuenciaFertilizante;
    String? nivelDificultad;
    double? expansion;
    String? epocaFlor;
    bool? seCosecha;
    double? medidaIdealFruto;
    double? precio;
    String? manualUrl;
  // List<dynamic> consejos;
  //  List<dynamic> beneficios;
    String? consejos;
    String? beneficios;

  
   factory Plant.fromMap(Map<String, dynamic> json) => Plant(
        id: json["id"] == null ? null : json["id"],
        isAdded: json["isAdded"] == null ? null : json["isAdded"],
        imagen: json["imagen"] == null ? null : json["imagen"],
        nombreComun: json["nombreComun"] == null ? null : json["nombreComun"],
        nombreCientifico: json["nombreCientifico"] == null ? null : json["nombreCientifico"],
       // descripcion: json["descripcion"] == null ? null : json["descripcion"],
        estado: json["estado"]  == null ? null : json["estado"],
        tareas: json["tareas"] == null ? [] : List<Tarea>.from(json["tareas"].map((x) => Tarea.fromJson(x))),
       // tareas: List<Tarea>.from(json["tareasPendientes"].map((x) => x)),
       // likes: json["likes"] == null ? [] : List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
       // likes: json["likes"] == null ? [] : (json["likes"] as List<dynamic>).map((like) => like).toList(),
      //  likes: List<dynamic>.from(json["likes"].map((x) => x))
        origen: json["origen"]  == null ? "" : json["origen"],
        tipoLuz: json["tipoLuz"]  == null ? null : json["tipoLuz"],
        temperaturaMinima: json["temperaturaMinima"]  == null ? null : json["temperaturaMinima"],
        temperaturaMaxima: json["temperaturaMaxima"]  == null ? null : json["temperaturaMaxima"],
        altura: json["altura"]  == null ? null : json["altura"],
        tamanoMaceta: json["tamanoMaceta"]  == null ? null : json["tamanoMaceta"],
        tipoRiego: json["tipoRiego"]  == null ? null : json["tipoRiego"],
        nivelHumedad: json["nivelHumedad"]  == null ? null : json["nivelHumedad"],
        riegoFrecuente: json["riegoFrecuente"]  == null ? null : json["riegoFrecuente"],
        aptaMascotas: json["aptaMascotas"]  == null ? null : json["aptaMascotas"],
        esDeInterior: json["esDeInterior"]  == null ? null : json["esDeInterior"],
        ubicacionCasa: json["ubicacionCasa"]  == null ? null : json["ubicacionCasa"],
        cicloRiegoGeneral: json["cicloRiegoGeneral"]  == null ? null : json["cicloRiegoGeneral"],
        cicloRiegoVerano: json["cicloRiegoVerano"] == null ? null : json["cicloRiegoVerano"],
        cicloRiegoOtono: json["cicloRiegoOtono"] == null ? null : json["cicloRiegoOtono"],
        cicloRiegoInvierno: json["cicloRiegoInvierno"] == null ? null : json["cicloRiegoInvierno"],
        cicloRiegoPrimavera: json["cicloRiegoPrimavera"] == null ? null : json["cicloRiegoPrimavera"],
        frecuenciaAbono: json["frecuenciaAbono"] == null ? null : json["frecuenciaAbono"],
        frecuenciaFertilizante: json["frecuenciaFertilizante"] == null ? null : json["frecuenciaFertilizante"],
        nivelDificultad: json["nivelDificultad"] == null ? null : json["nivelDificultad"],
        expansion: json["expansion"] == null ? null : json["expansion"],
        epocaFlor: json["epocaFlor"] == null ? null : json["epocaFlor"],
        seCosecha: json["seCosecha"] == null ? null : json["seCosecha"],
        medidaIdealFruto: json["medidaIdealFruto"] == null ? null : json["medidaIdealFruto"],
        precio: json["precio"] == null ? null : json["precio"],
        manualUrl: json["manualUrl"] == null ? null : json["manualUrl"],
       // consejos: json["consejos"] == null ? [] : (json["consejos"] as List<dynamic>).map((consejo) => consejo).toList(),
       // beneficios: json["beneficios"] == null ? [] : (json["beneficios"] as List<dynamic>).map((beneficio) => beneficio).toList(),
        consejos: json["consejos"] == null ? null : json["consejos"],
        beneficios: json["beneficios"] == null ? null : json["beneficios"]
    );

    String toJson() => jsonEncode(toMap());

    Map<String, dynamic> toMap() => {
        "imagen": imagen == null ? null : imagen,
        "nombreComun": nombreComun == null ? null : nombreComun,
        "nombreCientifico": nombreCientifico == null ? null : nombreCientifico,
       // "descripcion": descripcion,
        "estado": estado == null ? null : estado,
        "tareas": tareas == null ? [] : List<Tarea>.from(tareas!.map((x) => x)),
      //  "likes": List<dynamic>.from(likes!.map((x) => x)),
        "origen": origen == null ? null : origen,
        "tipoLuz": tipoLuz == null ? null : tipoLuz,
        "temperaturaMinima": temperaturaMinima == null ? null : temperaturaMinima,
        "temperaturaMaxima": temperaturaMaxima == null ? null : temperaturaMaxima,
        "altura": altura == null ? null : altura,
        "tamanoMaceta": tamanoMaceta == null ? null : tamanoMaceta,
        "tipoRiego": tipoRiego == null ? null : tipoRiego,
        "nivelHumedad": nivelHumedad == null ? null : nivelHumedad,
        "riegoFrecuente": riegoFrecuente == null ? null : riegoFrecuente,
        "aptaMascotas": aptaMascotas == null ? null : aptaMascotas,
        "esDeInterior": esDeInterior == null ? null : esDeInterior,
        "ubicacionCasa": ubicacionCasa == null ? null : ubicacionCasa,
        "cicloRiegoGeneral": cicloRiegoGeneral == null ? null : cicloRiegoGeneral,
        "cicloRiegoVerano": cicloRiegoVerano == null ? null : cicloRiegoVerano,
        "cicloRiegoOtono": cicloRiegoOtono == null ? null : cicloRiegoOtono,
        "cicloRiegoInvierno": cicloRiegoInvierno == null ? null : cicloRiegoInvierno,
        "cicloRiegoPrimavera": cicloRiegoPrimavera == null ? null : cicloRiegoPrimavera,
        "frecuenciaAbono": frecuenciaAbono == null ? null : frecuenciaAbono,
        "frecuenciaFertilizante": frecuenciaFertilizante == null ? null : frecuenciaFertilizante,
        "nivelDificultad": nivelDificultad == null ? null : nivelDificultad,
        "expansion": expansion == null ? null : expansion,
        "epocaFlor": epocaFlor == null ? null : epocaFlor,
        "seCosecha": seCosecha == null ? null : seCosecha,
        "medidaIdealFruto": medidaIdealFruto == null ? null : medidaIdealFruto,
        "precio": precio == null ? null : precio,
        "manualUrl": manualUrl == null ? null : manualUrl,
       // "consejos": List<String>.from(consejos.map((x) => x)),
       // "beneficios": List<String>.from(beneficios.map((x) => x)),
        "consejos": consejos == null ? null : consejos,
        "beneficios": beneficios == null ? null : beneficios
    };

    Plant copy(bool isAddedPlant) => Plant(
      id: id,
      isAdded: isAddedPlant,
      imagen: imagen, 
      nombreComun: nombreComun, 
      nombreCientifico: nombreCientifico, 
      estado: estado,
      tareas: tareas, 
     // likes: likes, 
      consejos: consejos, 
      beneficios: beneficios,
      tipoLuz: tipoLuz,
      tipoRiego: tipoRiego,
      origen: origen,
      cicloRiegoGeneral: cicloRiegoGeneral,
      esDeInterior: esDeInterior,
      aptaMascotas: aptaMascotas,
      nivelHumedad: nivelHumedad,
      altura: altura,
      tamanoMaceta: tamanoMaceta,
      precio: precio,
      manualUrl: manualUrl,
     // descripcion: descripcion,
      frecuenciaAbono: frecuenciaAbono,
      frecuenciaFertilizante: frecuenciaFertilizante,
      cicloRiegoPrimavera: cicloRiegoPrimavera,
      cicloRiegoOtono: cicloRiegoOtono,
      cicloRiegoVerano: cicloRiegoVerano,
      cicloRiegoInvierno: cicloRiegoInvierno,
      expansion: expansion,
      epocaFlor: epocaFlor,
      temperaturaMaxima: temperaturaMaxima,
      temperaturaMinima: temperaturaMinima,
      riegoFrecuente: riegoFrecuente,
      seCosecha: seCosecha,
      medidaIdealFruto: medidaIdealFruto,
      ubicacionCasa: ubicacionCasa,
      nivelDificultad: nivelDificultad,
     );

     Plant empty() => Plant(
       id: id,
      isAdded: false,
      imagen: "", 
      nombreComun: "", 
      nombreCientifico: "", 
      estado: "",
      tareas: [], 
      consejos: "", 
      beneficios: "",
      tipoLuz: "",
      tipoRiego: "",
      origen: "",
      cicloRiegoGeneral: 0,
      esDeInterior: false,
      aptaMascotas: false,
      nivelHumedad: "",
      altura: 0,
      tamanoMaceta: "",
      precio: 0,
      manualUrl: "",
      frecuenciaAbono: 0,
      frecuenciaFertilizante: 0,
      cicloRiegoPrimavera: 0,
      cicloRiegoOtono: 0,
      cicloRiegoVerano: 0,
      cicloRiegoInvierno: 0,
      expansion: 0,
      epocaFlor: "",
      temperaturaMaxima: 0,
      temperaturaMinima: 0,
      riegoFrecuente: false,
      seCosecha: false,
      medidaIdealFruto: 0,
      ubicacionCasa: "",
      nivelDificultad: "",
     );

  //    @override
  // String toString() {
  //   // TODO: implement toString
  //   return 'DETALLES PLANTA: Nombre común: $nombreComun, Nombre científico: $nombreCientifico, Estado: $estado, Tareas: ${tareas!.length}';
  // }

  @override
  String toString() {
    return 'Plant(id: $id, isAdded: $isAdded, imagen: $imagen, nombreComun: $nombreComun, nombreCientifico: $nombreCientifico, estado: $estado, tareas: $tareas, origen: $origen, tipoLuz: $tipoLuz, temperaturaMinima: $temperaturaMinima, temperaturaMaxima: $temperaturaMaxima, altura: $altura, tamanoMaceta: $tamanoMaceta, tipoRiego: $tipoRiego, nivelHumedad: $nivelHumedad, riegoFrecuente: $riegoFrecuente, aptaMascotas: $aptaMascotas, esDeInterior: $esDeInterior, ubicacionCasa: $ubicacionCasa, cicloRiegoGeneral: $cicloRiegoGeneral, cicloRiegoVerano: $cicloRiegoVerano, cicloRiegoOtono: $cicloRiegoOtono, cicloRiegoInvierno: $cicloRiegoInvierno, cicloRiegoPrimavera: $cicloRiegoPrimavera, frecuenciaAbono: $frecuenciaAbono, frecuenciaFertilizante: $frecuenciaFertilizante, nivelDificultad: $nivelDificultad, expansion: $expansion, epocaFlor: $epocaFlor, seCosecha: $seCosecha, medidaIdealFruto: $medidaIdealFruto, precio: $precio, manualUrl: $manualUrl, consejos: $consejos, beneficios: $beneficios)';
  }

}





