// To parse this JSON data, do
//
//     final eventos = eventosFromJson(jsonString);

import 'dart:convert';

List<Eventos> eventosFromJson(String str) => List<Eventos>.from(json.decode(str).map((x) => Eventos.fromJson(x)));

String eventosToJson(List<Eventos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Eventos {
    Eventos({
        this.id,
        this.nombre,
        this.fecha,
        this.precio,
        this.descripcion,
        this.portada,
    });

    String id;
    String nombre;
    String fecha;
    String precio;
    String descripcion;
    Portada portada;

    factory Eventos.fromJson(Map<String, dynamic> json) => Eventos(
        id: json["_id"],
        nombre: json["nombre"],
        fecha: json["fecha"],
        precio: json["precio"],
        descripcion: json["descripcion"],
        portada: Portada.fromJson(json["portada"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "fecha": fecha,
        "precio": precio,
        "descripcion": descripcion,
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
