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

class Item {
  bool isExpanded;
  final String header;
  final Widget body;

  Item(this.isExpanded, this.header, this.body);
}

class _State extends State<MyApp>{

  //List of Item
  List<Item> _items = [];

  @override
  void initState() {
    for(int i = 0 ; i< 5; i++) {
      _items.add(new Item(false,'Item ${i}',new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Text('Body Item Here'),
          )
      ));
    }
  }

  ExpansionPanel _createItem(Item item) {
    //this is the expansionPanel Widget
    return new ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return new Container(
            padding: new EdgeInsets.all(5.0),
            child: new Text('Header ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded
    );
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
              new ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _items[index].isExpanded = !_items[index].isExpanded;
                  });
                },
                children: _items.map(_createItem).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
