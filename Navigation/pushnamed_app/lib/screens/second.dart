import 'package:flutter/material.dart';

class Second extends StatefulWidget{
  @override
  _SecondState createState() => new _SecondState();
}

class _SecondState extends State<Second>{
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
              new Text("Welcome to Second Page"),
              new ElevatedButton(onPressed: (){Navigator.of(context).pushNamed('/Third');}, child: new Text('Next')),
              new ElevatedButton(onPressed: (){Navigator.of(context).pushNamed('/Home');}, child: new Text('Back'))
            ],
          ),
        ),
      ),
    );
  }
}
