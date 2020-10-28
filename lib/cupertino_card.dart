import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/regione.dart';
import 'dart:ui' show ImageFilter;
import 'regione.dart';
import 'dettaglio_regione.dart';

class CupertinoCard extends StatelessWidget {
  CupertinoCard({Key key, this.regione}) : super(key: key);
  final Regione regione;
  @override
  Widget build(BuildContext context) {
    double _opacity = 0.4; // from 0-1.0
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: CupertinoButton(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/COVID.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.black.withOpacity(_opacity),
                ),
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                    child: Text(
                      regione.denominazioneRegione.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
              ),
            )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DettaglioRegione(regione: this.regione)),
          );
        },
      ),
    );
  }
}
