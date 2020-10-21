import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coronadata.dart';

class CountryInfo extends StatelessWidget {
  final Record record;
  CountryInfo({Key key, @required this.record}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(record.countriesAndTerritories
            .toString()
            .split(".")[1]
            .replaceAll("_", " ")),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.red,
            child: new Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/path118.png"),
                    alignment: Alignment.topRight,

              )),

              child: Align(child:Text("DEATHS " + record.deaths.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              alignment: Alignment.centerLeft,),
              padding: EdgeInsets.all(20),
            ),
          ),

          Card(
            color: Colors.blue,
            child: new Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/skull.jpg"),
                    alignment: Alignment.bottomRight,
                  )),
              child: Text("CASES " + record.cases.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              padding: EdgeInsets.all(20),
            ),
          ),
          MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!')),
        ],
      ),
    );
  }
}
