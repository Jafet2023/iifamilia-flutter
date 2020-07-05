import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/src/models/anuncios_model.dart';
import 'package:demo/src/models/devocional_model.dart';
import 'package:demo/src/services/services_strapi.dart';
import 'package:demo/src/widgets/header_widget.dart';
import 'package:demo/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';


class HomePage extends StatefulWidget {

 static final String routeName = 'homepage';
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int _currentIndex = 0;
  String _title ;

  static List<Widget> _children = [
    InicioPage(),
    BusinessPage(),
    SchoolPage(),
  ];

  @override
  void initState() {
    super.initState();
     _title = 'Oracion';
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("$_title"),
          centerTitle: true,
        ),
      drawer: MenuWidget(),
      body: _children.elementAt(_currentIndex),
      // body: Center(
      //   child: _children.elementAt(_currentIndex),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Oracion'),
            backgroundColor: Colors.blue,
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Inicio'),
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Devocional'),
            backgroundColor: Colors.blue
          ),
        ],
        currentIndex: _currentIndex,
        // selectedItemColor: Colors.amber[800],
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );

  }

  void _onItemTapped(int index) {
    setState(() {
      // int index= 0;
      _currentIndex = index;

      switch(index) { 
       case 0: { _title = 'Oracion'; } 
       break; 
       case 1: { _title = 'Inicio'; } 
       break;
       case 2: { _title = 'Devocional'; } 
       break;
      } 

    });
  }

}


//Oracion
class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: HeaderCurvo(),
        
      ),
       
      //  Container(
      //    alignment: Alignment.center,
      //   //  child: CachedNetworkImage(
      //   //   placeholder: (context, url) => const CircularProgressIndicator(),
      //   //   imageUrl: "https://i.pinimg.com/280x280_RS/02/4b/7d/024b7dc886b606cc8f1c4de167da96eb.jpg",
      //   //   fit: BoxFit.fitHeight

      //   // ),
        
      // ),
      // body: Container(
      //   decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: NetworkImage("url")
      //         )
      //       ),
        
      // ),
    );
    // return SingleChildScrollView(

    //       child: Padding(

    //         padding: const EdgeInsets.all(0),
    //         child: Column(
    //           children: <Widget>[
    //             // Title(child: Text("Devocional",),color: Colors.black,),
    //             // Image.network(post.portada.url),
    //             Card(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: <Widget>[
    //                   ListTile(
    //                     title: Text("Lideres"),
    //                     subtitle: Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas , las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",textAlign: TextAlign.justify,),
    //                   ),
    //                   ListTile(
    //                     title: Text("Telefonos"),
    //                     // subtitle: Text("${post.telefono} y ${post.telefonodos}"),
    //                     // onLongPress: (){customLaunch("tel:${post.telefono}");},
    //                   ),
    //                   // RaisedButton(
    //                   //  onPressed: () {
    //                   //   customLaunch("tel:${post.telefono}");
    //                   // },
    //                   // child: Text('Telefono'),
    //                   // ),
    //                   ListTile(
    //                     title: Text("Vision"),
    //                     // subtitle: Text("${post.vision}"),
    //                   ),
    //                   ListTile(
    //                     title: Text("Mision"),
    //                     // subtitle: Text("${post.mision}"),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
  }
}

// Inicio
class BusinessPage extends StatelessWidget {

  final ServiceIifamilia httpService = ServiceIifamilia();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.png"),
            // image: NetworkImage("https://cdn.pixabay.com/photo/2016/11/21/16/02/basket-1846135_1280.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<Anuncios>>(
          future: httpService.getAnuncios(),
          builder: (BuildContext context, AsyncSnapshot<List<Anuncios>> snapshot) {
            if (snapshot.hasData) {
              List<Anuncios> posts = snapshot.data;

              return ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          // viewportFraction: 0.2,
                          // aspectRatio: 0.1,
                          height: MediaQuery.of(context).size.height * 0.25,
                          enlargeCenterPage: true,
                        ),
                        items: posts.map((Anuncios post) => 
                        Container(
                          
                            // margin: const EdgeInsets.only(top: 50.0, left: 50.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(post.imagen.url),
                                fit: BoxFit.cover,
                              ),
                              // border:
                              //     Border.all(color: Theme.of(context).accentColor),
                              // borderRadius: BorderRadius.circular(50.0),
                            ),
                          ), 
                        ).toList()
                      ),

                       Card(
                         child: Column(
                           children: <Widget>[
                            
                           ],
                         ),
                       )
                        

                    ],
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        )
      )
    );
  }
}

//DevocionalPage
class SchoolPage extends StatelessWidget {

  final ServiceIifamilia httpService = ServiceIifamilia();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Container(
          
          decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/fondo.png"),
                  // image: NetworkImage("https://cdn.pixabay.com/photo/2016/11/21/16/02/basket-1846135_1280.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
        child: FutureBuilder<List<Devocional>>(
        future: httpService.getDevocional(),
        builder: (BuildContext context, AsyncSnapshot<List<Devocional>> snapshot) {
          if (snapshot.hasData) {
            List<Devocional> posts = snapshot.data;
            return ListView(
              children: posts.map(
                    (Devocional post) => 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Container(
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: AssetImage("assets/fondo.png"),
                        //       fit: BoxFit.cover
                        //     )
                        //   ),
                        // ),
                        Image.network(post.portada.url),
                        Card(
                          elevation: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.0),
                          
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                title: Text("Devocional"),
                                subtitle: Text("${post.descripcion}",textAlign: TextAlign.justify,),
                              ),
      
                              // RaisedButton(
                              //  onPressed: () {
                              //   customLaunch("tel:${post.telefono}");
                              // },
                              // child: Text('Telefono'),
                              // ),

                              ListTile(
                                title: Text("Redaccion"),
                                subtitle: Text(post.redaccion),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
        ),
    );
  }
}