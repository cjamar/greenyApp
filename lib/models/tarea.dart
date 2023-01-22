// TAREA MODEL *********************

class Tarea {

  Tarea({
    this.id,
    this.titulo,
    this.diasRetraso,
    this.isAcomplished,
    this.isActivated
  });

  String? id;
  String? titulo;
  int? diasRetraso;
  bool? isAcomplished;
  bool? isActivated;

  factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
    titulo: json["titulo"] == null ? null : json["titulo"], 
    diasRetraso: json["diasRetraso"] == null ? null : json["diasRetraso"], 
    isAcomplished: json["isAcomplished"] == null ? null : json["isAcomplished"], 
    isActivated: json["isActivated"] == null ? null : json["isActivated"]  
    );

  Map<String, dynamic> toJson() =>{
    "titulo": titulo == null ? null : titulo,
    "diasRetraso": diasRetraso == null ? null : diasRetraso,
    "isAcomplished": isAcomplished == null ? null : isAcomplished,
    "isActivated": isActivated == null ? null : isActivated
  };

  Tarea copy() => Tarea(
    titulo: titulo, 
    diasRetraso: diasRetraso, 
    isAcomplished: isAcomplished, 
    isActivated: isActivated
    );

    Tarea emptyCopy( )=> Tarea(
      titulo: '', 
      diasRetraso: 0, 
      isAcomplished: false, 
      isActivated: false
      );

      @override
  String toString() {
    // TODO: implement toString
    return 'DETALLE TAREA : (titulo : $titulo, Dias de retraso: $diasRetraso, Tarea cumplida: $isAcomplished, Tarea activada: $isActivated';
  }

}