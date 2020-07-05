import 'package:demo/src/models/iglesias_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetailIglesia extends StatelessWidget {

  final Iglesias post;

  PostDetailIglesia({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Iglesia: ${post.nombreiglesia}"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: 'assets/eclipse-loading.gif', 
                  image: post.portada.url
                ),
                // Image.network(post.portada.url),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Lideres"),
                        subtitle: Text(post.lideres),
                      ),

                      ListTile(
                        title: Text("Historia"),
                        subtitle: Text(post.historia),
                      ),

                      ListTile(
                        title: Text("Miembros"),
                        subtitle: Text(post.miembros),
                      ),

                      // ListTile(
                      //   title: Text("Telefonos"),
                      //   subtitle: Text("${post.telefono}",style: TextStyle(decoration: TextDecoration.underline),),
                      //   onTap: (){
                      //     customLaunch("tel:${post.telefono}");
                      //   },
                      // ),

                      ListTile(
                        title: Text("Telefonos"),
                        subtitle: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 10.0),

                              child: InkWell(
                                child: Text("${post.telefono}",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
                                onTap: () {
                                customLaunch("tel:${post.telefono}");
                                }
                              ),
                            ),

                            Container(  
                              child: _detectOS(),
                            ),

                          ],
                        )
                      ),

                      // RaisedButton(
                      //  onPressed: () {
                      //   customLaunch("tel:${post.telefono}");
                      // },
                      // child: Text('Telefono'),
                      // ),
                      // ListTile(
                      //   title: Text("Vision"),
                      //   subtitle: Text("${post.vision}"),
                      // ),
                      ListTile(
                        title: Text("Ubicacion"),
                        subtitle: Text("Abrir ubicacion",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
                        onTap: () async {
                        // Here we are supplying the variables that we've created above
                          final String googleMapsUrl = "http://maps.google.com/maps?f=q&q='${post.telefonodos}','${post.telefono}'&z=17";
                          final String appleMapsUrl = "https://maps.apple.com/?q='${post.telefonodos}','${post.telefono}'";

                          if (await canLaunch(googleMapsUrl)) {
                            await launch(googleMapsUrl);
                          }
                          else if (await canLaunch(appleMapsUrl)) {
                            await launch(appleMapsUrl, forceSafariVC: false);
                          } else {
                            throw "No se encontro la URL";
                          }
                        },
                        // subtitle: Text("${post.}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
  Widget _detectOS() {
    if (post.telefonodos == 0 ) {
  
      return InkWell(
        child: Text(" "),
      );
    } 
    else {
       return InkWell(
        child: Text("${post.telefonodos}" ,style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
        onTap: () {
          customLaunch("tel:${post.telefonodos}");
        }
      );
    }
  }
}

void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }