import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Bar Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Welcome to home Page"),
              new ElevatedButton(onPressed: (){Navigator.of(context).pushNamed('/Second');}, child: new Text('Next'))
            ],
          ),
        ),
      ),
    );
  }
}
