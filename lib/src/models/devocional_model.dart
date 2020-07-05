// To parse this JSON data, do
//
//     final devocional = devocionalFromJson(jsonString);

import 'dart:convert';

List<Devocional> devocionalFromJson(String str) => List<Devocional>.from(json.decode(str).map((x) => Devocional.fromJson(x)));

String devocionalToJson(List<Devocional> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Devocional {
    Devocional({
        this.id,
        this.redaccion,
        this.descripcion,
        this.fecha,
        this.portada,
    });

    String id;
    String redaccion;
    String descripcion;
    DateTime fecha;
    Portada portada;

    factory Devocional.fromJson(Map<String, dynamic> json) => Devocional(
        id: json["_id"],
        redaccion: json["redaccion"],
        descripcion: json["descripcion"],
        fecha: DateTime.parse(json["fecha"]),
        portada: Portada.fromJson(json["portada"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "redaccion": redaccion,
        "descripcion": descripcion,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "portada": portada.toJson(),
    };
}

class Portada {
    Portada({
        this.id,
        this.name,
        this.url,
    });

    String id;
    String name;
    String url;

    factory Portada.fromJson(Map<String, dynamic> json) => Portada(
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
