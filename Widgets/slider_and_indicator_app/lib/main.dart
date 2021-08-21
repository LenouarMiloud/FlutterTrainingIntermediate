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

enum countries{Algeria,Indonesia,Senghaphore,Malisia}

class _State extends State<MyApp>{

  double _value = 0.0;
  countries _selected = countries.Algeria;
  String _question = 'what is your country of burn';
  List<PopupMenuEntry<countries>> _items = [];

  @override
  void initState() {
    for(countries country in countries.values) {
      _items.add(new PopupMenuItem(
        child: new Text(_getDisplay(country),),
        value: country,
      ));
    }
  }

  void _onChange(double value) => setState(()=> _value = value);

  void _onSelecte(countries country){
    setState((){
      _selected = country;
      _question = 'You Selected ${_getDisplay(country)}';
    });
  }

  String _getDisplay(countries country){
    int index = country.toString().indexOf('.');
    index++;
    return country.toString().substring(index);
  }

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
              ),
              new PopupMenuButton<countries>(
                  child:  new Icon(Icons.input),
                  initialValue: countries.Algeria,
                  onSelected: _onSelecte,
                  itemBuilder: (BuildContext context) {
                    return _items;
                  }
              ),
              new Container(
                padding: new EdgeInsets.all(5.0),
                child: new Text(_question),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
