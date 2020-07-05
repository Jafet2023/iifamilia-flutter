import 'package:demo/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'dart:async';

class RadioAmericaPage extends StatefulWidget {

  static final String routeName = 'radioamerica';

  @override
  _RadioAmericaPageState createState() => _RadioAmericaPageState();
}

class _RadioAmericaPageState extends State<RadioAmericaPage> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController animationController;
  bool mReverse = false;

  String streamUrl = "http://204.197.245.100:8236";

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0,end: 1).animate(animationController);
    audioStart();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio America'),
        centerTitle: true,
        ),
        drawer: MenuWidget(),
        body: Container(
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7,           
                child: Icon(
                  Icons.radio,
                  size: 320,
                  color: Colors.white,
                  ),
              ),
              Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: InkWell(
                          onTap: (){
                            FlutterRadio.playOrPause(url: streamUrl);
                            if(mReverse == false)
                              animationController.forward();
                            else
                              animationController.reverse();
                              mReverse = !mReverse;
                          },
                          child: AnimatedIcon(
                            size: 100,
                            progress: animation,
                            icon: AnimatedIcons.play_pause,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,)
            ] 
          ),
        ),
    );
  }
}