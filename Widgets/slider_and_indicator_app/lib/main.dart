import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp>{

  double _value = 0.0;

  void _onChange(double value) => setState(()=> _value = value);

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
              new Slider(value: _value, onChanged: _onChange),
              new Container(
                padding: new EdgeInsets.all(11.2),
                child: new CircularProgressIndicator(
                  value: _value,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
              new Container(
                padding: new EdgeInsets.all(11.2),
                child: new LinearProgressIndicator(
                  value: _value,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.amber),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
