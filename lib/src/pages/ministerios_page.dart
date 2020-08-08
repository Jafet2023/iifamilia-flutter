import 'package:demo/src/pages/ministerio_informacion_page.dart';
import 'package:demo/src/services/services_strapi.dart';
import 'package:demo/src/widgets/header_widget.dart';
import 'package:demo/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:demo/src/models/ministerios_model.dart';


class MinisteriosPage extends StatelessWidget {

  final ServiceIifamilia httpService = ServiceIifamilia();

  static final String routeName = 'ministerios';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ministerios'),
          centerTitle: true,
        ),
        drawer: MenuWidget(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: HeaderWavePainter(),
            child: Center(
              child: FutureBuilder<List<Ministerios>>(
                future: httpService.getMinisterios(),
                builder: (BuildContext context, AsyncSnapshot<List<Ministerios>> snapshot) {
                  if (snapshot.hasData) {
                    List<Ministerios> posts = snapshot.data;
                    return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        padding: EdgeInsets.all(0),
                        children: posts
                        .map(
                        (Ministerios post) =>GestureDetector(
                          child: Stack(
                            children: <Widget>[
                            
                              new Container(
                                margin: const EdgeInsets.all(20),
                                
                                // width: 190.0,
                                // height: 190.0,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10),
                                  // color: const Color(0xff7c94b6),
                                  color: Colors.black.withOpacity(0.2),
                                  // shape: BoxShape.circle,
                                  
                                  image: new DecorationImage(
                                      
                                      // colorFilter: ColorFilter.linearToSrgbGamma(),
                                      fit: BoxFit.fill,
                                      image: new NetworkImage("${post.fotos.url}")
                                  ),
                                ),
                                ),
                                Container(
                                    // margin: const EdgeInsets.all(50),
                                    // padding: EdgeInsets.only(top: 160),
                                    // width: 200,
                                    // height: 200,
                                    alignment: Alignment.bottomCenter,
                                    // decoration: BoxDecoration(
                                      
                                    //   // color: Color.fromRGBO(0, 0, 0, 0.2),
                                    // ),
                                    // color: Colors.red,
                                    child: Text(
                                      post.nombre,textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                                    ),                        
                                  ),
                                  
                            ],
                          ),
      
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostDetail(
                                post: post,
                              ),
                            ),
                          ),
                        )
                      )
                      .toList(), );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ),
      );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Posts"),
  //     ),
  //     body: FutureBuilder(
  //       future: httpService.getStudent(),
  //       builder: (BuildContext context, AsyncSnapshot<List<Ministerios>> snapshot) {
  //         if (snapshot.hasData) {
  //           List<Ministerios> posts = snapshot.data;
            // return ListView(
            //   children: posts
            //       .map(
            //         (Ministerios post) => ListTile(
            //           title: Text("Name : ${post.nombre} \nLideres : ${post.lideres}"),
            //           subtitle: Text("${post.id}"),
            //           onTap: () => Navigator.of(context).push(
            //             MaterialPageRoute(
            //               builder: (context) => PostDetail(
            //                 post: post,
            //               ),
            //             ),
            //           ),
            //         ),
            //       )
            //       .toList(),
            // );
  //         } else {
  //           return Center(child: CircularProgressIndicator());
  //         }
  //       },
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Center(
  //         child: Text('Ministerios'),
  //       ),
  //     ),
      // drawer: MenuWidget(),
      // body: FutureBuilder(
      //   future: httpService.getStudent(),
      //   builder: (BuildContext context, AsyncSnapshot<List<Ministerios>> snapshot) {
      //     if (snapshot.hasData) {
      //       List<Ministerios> posts = snapshot.data;
      //       return ListView(
      //         children: posts
      //             .map(
      //               (Ministerios post) => ListTile(
      //                 title: Text("Name : ${post.nombre} \nLideres : ${post.lideres}"),
      //                 // subtitle: Text("${post.id}"),
      //                 trailing: Image.network(post.fotos.url),
      //                 onTap: () => Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                     builder: (context) => PostDetail(
      //                       post: post,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             )
      //             .toList(),
      //       );
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
  //   );
  // }

  
}