import 'package:demo/src/models/iglesias_model.dart';
import 'package:demo/src/pages/iglesias_informacion_page.dart';
import 'package:demo/src/services/services_strapi.dart';
import 'package:demo/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class IglesiasPage extends StatelessWidget {

  final ServiceIifamilia httpService = ServiceIifamilia();
  
  static final String routeName = 'iglesias';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iglesias Hijas'),
          centerTitle: true,
        ),
      drawer: MenuWidget(),
      body: FutureBuilder<List<Iglesias>>(
        future: httpService.getIglesias(),
        builder: (BuildContext context, AsyncSnapshot<List<Iglesias>> snapshot){
          if(snapshot.hasData){
            List<Iglesias> posts =snapshot.data;
            return ListView(
              
              children: posts
                  .map(
                    (Iglesias post) => InkWell(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            
                            // height: 100,
                            alignment: Alignment.topRight,
                            child: Card(
                              
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                post.portada.url,
                                fit: BoxFit.cover,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                          )
                          

                          // Card(
                          //   child: Image.network(
                          //     post.portada.url,
                          //     fit: BoxFit.cover,
                          //   ),
                          //   semanticContainer: true,
                          //   clipBehavior: Clip.antiAliasWithSaveLayer,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //   ),
                          //   elevation: 5,
                          //   margin: EdgeInsets.all(10),
                            
                          // ),

                          // Card(
                          //   semanticContainer: true,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //   ),
                          //   elevation: 5,
                          //   margin: EdgeInsets.all(10),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //         image: NetworkImage(post.portada.url),
                          //         fit: BoxFit.cover,
                          //         // alignment: Alignment.topCenter,
                          //       ),
                          //     ),
                          //     child: Text("YOUR TEXT"),
                          //   ),
                          // ),

                          // Center(
                          //   child: Container( 
                              
                          //     margin: const EdgeInsets.all(10),
                          //     // width: 330,
                          //     height: 100,
                          //     decoration: BoxDecoration(
                          //         // color: Colors.red,
                          //         // color: Color.fromRGBO(0, 0, 0, 0.4),
                          //         image: DecorationImage(
                          //             image: NetworkImage(post.portada.url),
                          //             fit: BoxFit.cover,
                          //             // colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
                          //             ),
                          //         borderRadius: BorderRadius.all(
                          //             Radius.circular(5.0)
                          //         ),
                                    
                          //         // borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          //         // boxShadow: [
                          //         //   BoxShadow(blurRadius: 8.0, color: Colors.black)
                          //         // ]
                          //       ),
                          //   ),
                          // ),
                          
                          // Center(
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     margin: const EdgeInsets.all(40),
                          //     // padding: EdgeInsets.all(100.0),
                          //     decoration: BoxDecoration(
                          //       color: Color.fromRGBO(0, 0, 0, 0.4),
                          //       borderRadius: BorderRadius.all(
                          //             Radius.circular(5.0)
                          //         ),
                          //     ),
                          //     // width: 255,
                          //     // height: 250,
                          //     child: Text(
                          //       post.nombreiglesia,style: TextStyle(color: Colors.white,fontSize: 23.0),textAlign: TextAlign.center,
                          //     ),
                          //   ),
                          // ),
                            
                          ],
                        ),

                        onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetailIglesia(
                            post: post,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
   }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Center(
  //         child: Text('Iglesias Hijas'),
  //       ),
  //     ),
  //     drawer: MenuWidget(),
  //     body: FutureBuilder(
  //       future: httpService.getMinisterios(),
  //       builder: (BuildContext context, AsyncSnapshot<List<Ministerios>> snapshot) {
  //         if (snapshot.hasData) {
  //           List<Ministerios> posts = snapshot.data;
  //           return ListView(
  //             children: posts
  //                 .map(
  //                   (Ministerios post) => ListTile(
  //                     title: Text("Name : ${post.nombre}"),
  //                     trailing: Image.network(post.fotos.url),
  //                     onTap: () => Navigator.of(context).push(
  //                       MaterialPageRoute(
  //                         builder: (context) => PostDetailIglesia(
  //                           post: post,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //                 .toList(),
  //           );
  //         } else {
  //           return Center(child: CircularProgressIndicator());
  //         }
  //       },
  //     ),
  //   );
  // }

}