import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'regione.dart';

class DettaglioRegione extends StatelessWidget {
  final Regione regione;
  DettaglioRegione({Key key, @required this.regione}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map<String, String> _datiGiornalieri = {
      "Decessi": regione.deceduti.toString(),
      "Nuovi casi": regione.nuoviPositivi.toString(),
      "Guariti": regione.dimessiGuariti.toString()
    };
    List<List<Color>> _colorCard = [
      [Colors.redAccent, Colors.redAccent[700]],
      [Colors.blue, Colors.deepPurple],
      [Colors.green, Colors.teal]
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(this.regione.denominazioneRegione),
        ),
        body: Column(
          children: [
            ...List.generate(_datiGiornalieri.length, (index) {
              String key = _datiGiornalieri.keys.elementAt(index);
              return Card(
                  child: Container(
                width: 1000,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: _colorCard[index],
                    )),
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(key.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800))),
                  Text(_datiGiornalieri[key],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w800)),
                ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
              ));
            }),
            MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!')),
          ],
        ));
  }
}
