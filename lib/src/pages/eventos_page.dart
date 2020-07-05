import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:demo/src/models/eventos_model.dart';
import 'package:demo/src/services/services_strapi.dart';
import 'package:demo/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class EventosPage extends StatefulWidget {

  static final String routeName = 'eventos';

  @override
  _EventosPage createState() => _EventosPage();
}

class _EventosPage extends State<EventosPage> {
  
  final ServiceIifamilia httpService = ServiceIifamilia();

  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController = new ScrollController();
  // }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }

  @override
  Widget build(BuildContext context) {

    // String _message;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Eventos y Horarios"),
            centerTitle: true,
            bottom: TabBar(
                // isScrollable: true,
                tabs: [
                  // Tab(icon: Icon(Icons.directions_car)),
                  //   Tab(icon: Icon(Icons.directions_transit)),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Horarios ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        Icon(Icons.home, color: Colors.white),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.home, color: Colors.white),
                        Text(
                          ' Eventos',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
          drawer: MenuWidget(),
          body: new TabBarView(
            children: <Widget>[
              //Horarios
              new Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/fondo.png"),
                    // image: NetworkImage("https://cdn.pixabay.com/photo/2016/11/21/16/02/basket-1846135_1280.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //Eventos
              // _events(),
              GestureDetector(
                child: LiquidPullToRefresh(
                  onRefresh: _handleRefresh,
                  key: _refreshIndicatorKey,
                  showChildOpacityTransition: false,
                  child: FutureBuilder<List<Eventos>>(
                    future: httpService.getEventos(),
                    builder: (BuildContext context, AsyncSnapshot<List<Eventos>> snapshot) {
                      if (snapshot.hasData) {
                        List<Eventos> posts = snapshot.data;
                        return ListView(
                          children: posts
                              .map(
                                (Eventos post) => InkWell(
                                    child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        leading: Container(
                                          padding: EdgeInsets.only(right: 12.0),
                                          decoration: new BoxDecoration(
                                              border: new Border(
                                                  right: new BorderSide(
                                                      width: 1.0, color: Colors.black))),
                                          // child: Icon(Icons.autorenew, color: Colors.black),
                                          child: Text(post.fecha),
                                        ),
                                        title: Text(
                                          post.nombre,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(post.descripcion),
                                      )
                                    ],
                                  ),
                                )
                                    //   onTap: () => Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => PostDetailIglesia(
                                    //       post: post,
                                    //     ),
                                    //   ),
                                    // ),
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
                onTap: () { }
              ),
              


//Timer(const Duration(seconds: 3), () {
      // completer.complete();
      
              // Container(
              //   height: 44.0,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: <Widget>[
              //       // RaisedButton(
              //       //   onPressed: null,
              //       //   child: Text("Facebook"),
              //       // ),
              //       Container(
              //         child: Text("nuevo"),
              //         color: Colors.black,
              //       ),
              //       Padding(padding: EdgeInsets.all(10)),
              //       Container(
              //         child: Text("texto 2"),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ));
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Eventos"),
    //     centerTitle: true,
    //   ),
    //   drawer: MenuWidget(),
    //   body: Container(
    //     decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: NetworkImage("https://previews.123rf.com/images/oasis15/oasis151507/oasis15150700034/42018763-tel%C3%A9fono-inteligente-de-construcci%C3%B3n-blanco-software-y-desarrollo-de-aplicaciones-m%C3%B3viles-cubierta-del-libro.jpg"),
    //             fit: BoxFit.cover
    //           )
    //         ),
    //   )
    //   // body: Image.network("https://previews.123rf.com/images/oasis15/oasis151507/oasis15150700034/42018763-tel%C3%A9fono-inteligente-de-construcci%C3%B3n-blanco-software-y-desarrollo-de-aplicaciones-m%C3%B3viles-cubierta-del-libro.jpg"),
    // );
  }

  Widget _events() {
    return FutureBuilder<List<Eventos>>(
      future: httpService.getEventos(),
      builder: (BuildContext context, AsyncSnapshot<List<Eventos>> snapshot) {
        if (snapshot.hasData) {
          List<Eventos> posts = snapshot.data;
          return ListView(
            children: posts
                .map(
                  (Eventos post) => InkWell(
                      child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black))),
                            // child: Icon(Icons.autorenew, color: Colors.black),
                            child: Text(post.fecha),
                          ),
                          title: Text(
                            post.nombre,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(post.descripcion),
                        )
                      ],
                    ),
                  )
                      //   onTap: () => Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => PostDetailIglesia(
                      //       post: post,
                      //     ),
                      //   ),
                      // ),
                      ),
                )
                .toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
