import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class clock extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<clock>{

  String _value = 'Time Here';
  Timer? _timer;

  @override
  void initState() {
    _timer = new Timer.periodic(new Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm:ss');
    String formatted = formatter.format(now);
    setState(() => _value = formatted);
  }


  @override
  Widget build(BuildContext context) {
    return new Text(_value, style: new TextStyle(fontSize: 32.0),);
  }
}
