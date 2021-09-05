import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

//Actions for redux
enum Actions { Increment, Decrement }


int reducer(int state, dynamic action) {
  if (action == Actions.Increment) state++;
  if (action == Actions.Decrement) state--;

  return state;
}


void main() {
  final store = new Store<int>(reducer, initialState: 0);

  runApp(new MyApp(
    store: store,
  ));

}


class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.store}) : super(key: key);
  final Store<int> store;

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<int>(
        store: store,
        child: new MaterialApp(
          title: 'First Flutter Redux',
          home: new Scaffold(
            appBar: new AppBar(
              title: new Text('My Redux App'),
            ),
            body: new Container(
                padding: new EdgeInsets.all(32.0),
                child: new Center(
                  child: new Column(
                    children: <Widget>[

                      new StoreConnector<int, String>(
                        converter: (store) => store.state.toString(),
                        builder: (context, count) {
                          return new Text(
                              count,
                              style: new TextStyle(fontSize: 24.0)
                          );
                        },

                      ),

                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(icon: new Icon(Icons.add), onPressed: ()=> store.dispatch(Actions.Increment)),
                          new IconButton(icon: new Icon(Icons.remove), onPressed: ()=> store.dispatch(Actions.Decrement)),
                        ],
                      ),


                    ],
                  ),
                )
            ),
          ),
        )
    );
  }
}