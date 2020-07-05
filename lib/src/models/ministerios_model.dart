// To parse this JSON data, do
//
//     final ministerios = ministeriosFromJson(jsonString);

import 'dart:convert';

List<Ministerios> ministeriosFromJson(String str) => List<Ministerios>.from(json.decode(str).map((x) => Ministerios.fromJson(x)));

String ministeriosToJson(List<Ministerios> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ministerios {
    String id;
    String nombre;
    String lideres;
    int telefono;
    String mision;
    String vision;
    int telefonodos;
    Fotos fotos;
    Fotos portada;

    Ministerios({
        this.id,
        this.nombre,
        this.lideres,
        this.telefono,
        this.mision,
        this.vision,
        this.telefonodos,
        this.fotos,
        this.portada,
    });

    factory Ministerios.fromJson(Map<String, dynamic> json) => Ministerios(
        id: json["_id"],
        nombre: json["nombre"],
        lideres: json["lideres"],
        telefono: json["telefono"],
        mision: json["mision"],
        vision: json["vision"],
        telefonodos: json["telefonodos"],
        fotos: Fotos.fromJson(json["fotos"]),
        portada: Fotos.fromJson(json["portada"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "lideres": lideres,
        "telefono": telefono,
        "mision": mision,
        "vision": vision,
        "telefonodos": telefonodos,
        "fotos": fotos.toJson(),
        "portada": portada.toJson(),
    };
}

class Fotos {
    String id;
    String name;
    String url;

    Fotos({
        this.id,
        this.name,
        this.url,
    });

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
