// To parse this JSON data, do
//
//     final anuncios = anunciosFromJson(jsonString);

import 'dart:convert';

List<Anuncios> anunciosFromJson(String str) => List<Anuncios>.from(json.decode(str).map((x) => Anuncios.fromJson(x)));

String anunciosToJson(List<Anuncios> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Anuncios {
    Anuncios({
        this.id,
        this.descripcion,
        this.imagen,
    });

    String id;
    String descripcion;
    Imagen imagen;

    factory Anuncios.fromJson(Map<String, dynamic> json) => Anuncios(
        id: json["_id"],
        descripcion: json["descripcion"],
        imagen: Imagen.fromJson(json["imagen"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "descripcion": descripcion,
        "imagen": imagen.toJson(),
    };
}

class Imagen {
    Imagen({
        this.id,
        this.name,
        this.url,
    });

    String id;
    String name;
    String url;

    factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
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
