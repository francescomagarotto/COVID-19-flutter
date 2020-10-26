import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'regione.dart';

class DettaglioRegione extends StatelessWidget {
  Regione regione;
  DettaglioRegione({Key key, @required this.regione}) : super(key: key);

  Widget _formatText(String text) {
    return Align(child:Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20)),
        alignment: Alignment.centerLeft);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.regione.denominazioneRegione),
      ),
      backgroundColor: Colors.white,
      body: Column(
    children:[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Card(
            color: Colors.red,
            child: new Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _formatText("Deceduti".toUpperCase()),
                  _formatText(regione.deceduti.toString())
                ],
              ),
              padding: EdgeInsets.all(8),
            ),
          )),


          Expanded(child: Card(
            color: Colors.blue,
            child: new Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _formatText("Casi testati".toUpperCase()),
                  _formatText(regione.casiTestati.toString())
                ]),
              padding: EdgeInsets.all(8),
            ),
          )),
          Expanded(child: Card(
            color: Colors.green,
            child: new Container(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _formatText("Dimessi".toUpperCase()),
                    _formatText(regione.dimessiGuariti.toString())
                  ]),
              padding: EdgeInsets.all(8),
            ),
          )),
        ],
      ),

          MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!')),

    ]));
  }
}
