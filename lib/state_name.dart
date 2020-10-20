import 'package:flutter/material.dart';

class StateName extends StatelessWidget {
  String stateName;
  StateName({Key key, this.stateName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: FittedBox(
          fit: BoxFit.contain,
          child: Icon(Icons.map, color: Colors.blue),)),
    Expanded( child:Text(stateName.split(".")[1].replaceAll("_", " "))),
    ]);
  }
}
