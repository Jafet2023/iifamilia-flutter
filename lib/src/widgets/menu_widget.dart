import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demo/src/pages/eventos_page.dart';
import 'package:demo/src/pages/home_page.dart';
import 'package:demo/src/pages/iglesias_page.dart';
import 'package:demo/src/pages/ministerios_page.dart';
import 'package:demo/src/pages/radioamerica_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart'; 

class MenuWidget extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pentecostes-2020.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            leading: Icon( Icons.home, color: Colors.blue),
            title: Text('Inicio'),
            onTap: ()=>Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),

          ListTile(
            leading: Icon( FontAwesomeIcons.users, color: Colors.blue.shade500),
            title: Text('Ministerios'),
            // onTap: ()=> Navigator.pushNamed(context, MinisteriosPage.routeName),
            onTap: (){
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, MinisteriosPage.routeName  );
            }
          ),

          ListTile(
            leading: Icon( FontAwesomeIcons.church, color: Colors.blue),
            title: Text('Iglesias Hijas'),
            //  onTap: ()=> Navigator.pushNamed(context, IglesiasPage.routeName),
            onTap: (){
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, IglesiasPage.routeName  );
            }
          ),

          ListTile(
            leading: Icon( Icons.calendar_today, color: Colors.blue),
            title: Text('Eventos y Cultos'),
            // onTap: ()=> Navigator.pushNamed(context, EventosPage.routeName),
            onTap: (){
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, EventosPage.routeName  );
            }
          ),

          // ListTile(
          //   leading: Icon( FontAwesomeIcons.mapMarkedAlt, color: Colors.blue),
          //   title: Text('Grupos C.A.F.E.'),
          //   // onTap: ()=> Navigator.pushNamed(context, EventosPage.routeName),
          //   onTap: (){
          //     // Navigator.pop(context);
          //     Navigator.pushReplacementNamed(context, EventosPage.routeName  );
          //   }
          // ),

          ListTile(
            leading: Icon( FontAwesomeIcons.broadcastTower, color: Colors.blue),
            title: Text('Radio America'),
            // onTap: ()=> Navigator.pushNamed(context, RadioAmericaPage.routeName),
            onTap: (){
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, RadioAmericaPage.routeName  );
            }
          ),

          ListTile(
            leading: Icon( FontAwesomeIcons.mapMarkerAlt, color: Colors.blue),
            title: Text('Ubicacion'),
            onTap: () async {
            // Here we are supplying the variables that we've created above
              final String googleMapsUrl = "http://maps.google.com/maps?f=q&q=-17.7706416,-63.1753162&z=17";
              final String appleMapsUrl = "https://maps.apple.com/?q=-17.7706416,-63.1753162";

              if (await canLaunch(googleMapsUrl)) {
                await launch(googleMapsUrl);
              }
              else if (await canLaunch(appleMapsUrl)) {
                await launch(appleMapsUrl, forceSafariVC: false);
              } else {
                throw "No se encontro la URL";
              }
            },
          ),

          ExpansionTile(
            title: Text("Redes Sociales"),
            leading: Icon( FontAwesomeIcons.shareAlt, color: Colors.blue),
            children: <Widget>[
                ListTile(
                  leading: Icon( FontAwesomeIcons.instagram, color: Colors.blue),
                  title: Text('Instagram'),
                  onTap: () async {
                  // Here we are supplying the variables that we've created above
                    final String googleMapsUrl = "https://instagram.com/_u/iifamilia/";
                    // final String appleMapsUrl = "https://maps.apple.com/?q=-17.7706416,-63.1753162";

                    if (await canLaunch(googleMapsUrl)) {
                      await launch(googleMapsUrl);
                    }
                    // if (await canLaunch(appleMapsUrl)) {
                    //   await launch(appleMapsUrl, forceSafariVC: false);
                    // } else {
                    //   throw "No se encontro la URL";
                    // }
                  },
                ),

                ListTile(
                  leading: Icon( FontAwesomeIcons.facebook, color: Colors.blue),
                  title: Text('Facebook'),
                  onTap: () async {
                  // Here we are supplying the variables that we've created above
                    final String googleMapsUrl = "https://www.facebook.com/128909820512426";
                    // final String appleMapsUrl = "https://maps.apple.com/?q=-17.7706416,-63.1753162";

                    if (await canLaunch(googleMapsUrl)) {
                      await launch(googleMapsUrl);
                    }
                    // if (await canLaunch(appleMapsUrl)) {
                    //   await launch(appleMapsUrl, forceSafariVC: false);
                    // } else {
                    //   throw "No se encontro la URL"; id="128909820512426"
                    // }
                  },
                ),

                // ListTile(
                //   leading: Icon( FontAwesomeIcons.facebook, color: Colors.blue),
                //   title: Text('Facebook'),
                //   onTap: () async {
                //     var url = 'https://www.instagram.com/iifamilia/';

                //     if (await canLaunch(url)) {
                //       await launch(
                //         url,
                //         universalLinksOnly: true,
                //       );
                //     } else {
                //       throw 'There was a problem to open the url: $url';
                //     }
                //   // // Here we are supplying the variables that we've created above
                //   //   final String googleMapsUrl = "https://www.facebook.com/128909820512426";
                //   //   // final String appleMapsUrl = "https://maps.apple.com/?q=-17.7706416,-63.1753162";

                //   //   if (await canLaunch(googleMapsUrl)) {
                //   //     await launch(googleMapsUrl);
                //   //   }
                //   //   // if (await canLaunch(appleMapsUrl)) {
                //   //   //   await launch(appleMapsUrl, forceSafariVC: false);
                //   //   // } else {
                //   //   //   throw "No se encontro la URL"; id="128909820512426"
                //   //   // }
                //   },
                // ),

                ListTile(
                  leading: Icon( FontAwesomeIcons.youtube, color: Colors.blue),
                  title: Text('Youtube'),
                  onTap: () async {
                  // Here we are supplying the variables that we've created above
                    final String googleMapsUrl = "https://www.youtube.com/channel/UC7gncJVqJQtHkQb4duQh4FA";
                    // final String appleMapsUrl = "https://maps.apple.com/?q=-17.7706416,-63.1753162";

                    if (await canLaunch(googleMapsUrl)) {
                      await launch(googleMapsUrl);
                    }
                    // if (await canLaunch(appleMapsUrl)) {
                    //   await launch(appleMapsUrl, forceSafariVC: false);
                    // } else {
                    //   throw "No se encontro la URL";
                    // }
                  },
                ),
              ],
          ),

          

          

          // RaisedButton.icon( fb://profile
          //assets\pentecostes-2020.jpg
          // /// Documentation :
          // /// Google Maps in a browser: "http://maps.google.com/?q=<lat>,<lng>"
          // /// Google Maps app on an iOS mobile device : "comgooglemaps://?q=<lat>,<lng>"
          // /// Google Maps app on Android : "geo:<lat>,<lng>?z=<zoom>"
          // /// You can also use "google.navigation:q=latitude,longitude"
          // /// z is the zoom level (1-21) , q is the search query
          // /// t is the map type ("m" map, "k" satellite, "h" hybrid, "p" terrain, "e" GoogleEarth)

          // onPressed: () =>  _launchURL("google.navigation:q=${_mapLocation['latitude']},${_mapLocation['longitude']}"),
          // icon: Icon(Icons.location_on),
          // label: Text("Open Maps"),
          // ),


          // InkWell(
            
          //   onTap: (){},
          //   child: ListTile(
          //     title: Text('Settings'),
          //     leading: Icon(Icons.help, color: Colors.red),
          //   ),
          // ),
          
        ],
      ),
    );
  }
}
 