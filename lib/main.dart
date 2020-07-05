import 'package:demo/src/pages/eventos_page.dart';
import 'package:demo/src/pages/home_page.dart';
import 'package:demo/src/pages/iglesias_page.dart';
import 'package:demo/src/pages/ministerios_page.dart';
import 'package:demo/src/pages/radioamerica_page.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    OneSignal.shared.init('ee3c7cde-91b5-4705-9597-877006a0e04e');
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
    return MaterialApp(
      initialRoute: HomePage.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName : (BuildContext context ) => HomePage(),
        MinisteriosPage.routeName : (BuildContext context ) => MinisteriosPage(),
        RadioAmericaPage.routeName : (BuildContext context ) => RadioAmericaPage(),
        IglesiasPage.routeName: (BuildContext context) => IglesiasPage(),
        EventosPage.routeName: (BuildContext context) => EventosPage(),
      },
    );
  }
}

