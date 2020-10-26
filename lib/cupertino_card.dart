import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/regione.dart';

import 'regione.dart';
import 'dettaglio_regione.dart';
class CupertinoCard extends StatelessWidget {
  CupertinoCard({Key key, this.regione}) : super(key: key);
  final Regione regione;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CupertinoButton(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/COVID.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text(
                regione.denominazioneRegione.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DettaglioRegione(regione: this.regione)),
            );
          },
        ),
      );
  }
}