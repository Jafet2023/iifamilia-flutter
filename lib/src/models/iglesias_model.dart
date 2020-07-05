// To parse this JSON data, do
//
//     final iglesias = iglesiasFromJson(jsonString);

import 'dart:convert';

List<Iglesias> iglesiasFromJson(String str) =>
    List<Iglesias>.from(json.decode(str).map((x) => Iglesias.fromJson(x)));

String iglesiasToJson(List<Iglesias> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Iglesias {
  Iglesias(
      {this.id,
      this.nombreiglesia,
      this.lideres,
      this.telefono,
      this.telefonodos,
      this.fotos,
      this.portada,
      this.historia,
      this.miembros
      });

  String id;
  String nombreiglesia;
  String lideres;
  int telefono;
  int telefonodos;
  Fotos fotos;
  Fotos portada;
  String historia;
  String miembros;

  factory Iglesias.fromJson(Map<String, dynamic> json) => Iglesias(
        id: json["_id"],
        nombreiglesia: json["nombreiglesia"],
        lideres: json["lideres"],
        telefono: json["telefono"],
        telefonodos: json["telefonodos"],
        fotos: Fotos.fromJson(json["fotos"]),
        portada: Fotos.fromJson(json["portada"]),
        historia: json["historia"],
        miembros: json["miembros"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombreiglesia": nombreiglesia,
        "lideres": lideres,
        "telefono": telefono,
        "telefonodos": telefonodos,
        "fotos": fotos.toJson(),
        "portada": portada.toJson(),
        "historia": historia,
        "miembros": miembros,
      };
}

class Fotos {
  Fotos({
    this.id,
    this.name,
    this.url,
  });

  String id;
  String name;
  String url;

  factory Fotos.fromJson(Map<String, dynamic> json) => Fotos(
        id: json["_id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "url": url,
      };
}
