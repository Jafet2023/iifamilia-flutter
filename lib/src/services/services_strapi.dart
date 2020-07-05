import 'package:demo/src/models/anuncios_model.dart';
import 'package:demo/src/models/eventos_model.dart';
import 'package:demo/src/models/iglesias_model.dart';
import 'package:demo/src/models/ministerios_model.dart';
import 'package:demo/src/models/devocional_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

class ServiceIifamilia {

  final String _url='https://strapi-iifamilia.herokuapp.com';

  Future<List<Ministerios>> getMinisterios() async {
    
    Response res = await get('$_url/ministerios');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Ministerios> posts = body
          .map(
            (dynamic item) => Ministerios.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  
  Future<List<Iglesias>> getIglesias() async {
    
    Response res = await get('$_url/iglesiashijas');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Iglesias> posts = body
          .map(
            (dynamic item) => Iglesias.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<List<Anuncios>> getAnuncios() async {
    
    Response res = await get('$_url/anuncios');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Anuncios> posts = body
          .map(
            (dynamic item) => Anuncios.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<List<Devocional>> getDevocional() async {
    
    Response res = await get('$_url/devocionals');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Devocional> posts = body
          .map(
            (dynamic item) => Devocional.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<List<Eventos>> getEventos() async {
    
    Response res = await get('$_url/eventos');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Eventos> posts = body
          .map(
            (dynamic item) => Eventos.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

}