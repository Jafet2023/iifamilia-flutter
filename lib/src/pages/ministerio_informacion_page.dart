import 'package:demo/src/models/ministerios_model.dart';
import 'package:demo/src/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetail extends StatelessWidget {
  final Ministerios post;

  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ministerio: ${post.nombre}"),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: HeaderWavePainter(),
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      // Image.network(post.portada.url),
                      
                      // FadeInImage.assetNetwork(
                      //   placeholder: 'assets/eclipse-loading.gif', 
                      //   image: post.portada.url,
                      //   // width: 200,
                      //   // height: 200,
                      //   fit: BoxFit.cover,
                      //   // placeholderScale: 0.5,
                      // ),

                      FadeInImage(
                        // width: double.infinity,
                        
                        image: NetworkImage( post.portada.url ),
                        placeholder: AssetImage('assets/jar-loading.gif'),
                        // height: 300.0,
                        fit: BoxFit.cover,
                      ),

                      ListTile(
                        title: Text("Lideres"),
                        subtitle: Text(post.lideres),
                      ),

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
                              // child: InkWell(
                              //   child:
                              //   // (
                              //     // if (post.telefonodos == 0) {
                              //     // Text (" ")
                                  
                              //     // } else{
                              //     //   Text("${post.telefonodos}")
                              //     // }
                              //   // ),
                              //     Text("${post.telefonodos}" ,style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
                              //   onTap: () {
                              //   // customLaunch("tel:${post.telefonodos}");
                                
                              //     //  else{
                              //     //   // customLaunch("tel:${post.telefonodos}");
                              //     //   new Text ("  ");
                                    
                              //     // }

                              //   }
                              // ),
                            ),

                          ],
                        )
                      ),

                      ListTile(
                        title: Text("Vision"),
                        subtitle: Text("${post.vision}"),
                      ),
                      ListTile(
                        title: Text("Mision"),
                        subtitle: Text("${post.mision}"),
                      ),

                      // ListTile(
                      //   title: Text("Telefonos"),
                      //   subtitle: new InkWell(
                      //     child: Text("${post.telefono}""${post.telefonodos}", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      //     onTap: () {
                      //     customLaunch("tel:${post.telefono}" "tel:${post.telefonodos}");
                      //     }
                      //   )
                      // ),

                    ],
                  )
                
                // Image.network(post.portada.url),

                // ListTile(
                //   title: Text("Lideres"),
                //   subtitle: Text(post.lideres),
                // ),

                // ListTile(
                  
                //   title: Text("Telefonos"),
                //   subtitle: new InkWell(
                //     child: Text("${post.telefono}""${post.telefonodos}", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                //     onTap: () {
                //     customLaunch("tel:${post.telefono}" "tel:${post.telefonodos}");
                //     }
                //   )
                // ),

                // Row(
                //   children: <Widget>[
                //      ListTile(
                  
                //       title: Text("Telefonos"),
                //       subtitle: new InkWell(
                //         child: Text("${post.telefono}""${post.telefonodos}", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                //         onTap: () {
                //         customLaunch("tel:${post.telefono}" "tel:${post.telefonodos}");
                //         }
                //       )
                //     ),
                //   ],
                // ),

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
                // ListTile(
                //   title: Text("Mision"),
                //   subtitle: Text("${post.mision}"),
                // ),

          ),
        )
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