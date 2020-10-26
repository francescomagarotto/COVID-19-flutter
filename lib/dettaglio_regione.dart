import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'regione.dart';

class DettaglioRegione extends StatelessWidget {
  final Regione regione;
  DettaglioRegione({Key key, @required this.regione}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _datiGiornalieri = {
      "Decessi": regione.deceduti.toString(),
      "Nuovi casi": regione.nuoviPositivi.toString(),
      "Guariti": regione.dimessiGuariti.toString()
    };
    return Scaffold(
        appBar: AppBar(
          title: Text(this.regione.denominazioneRegione),
        ),
        backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                  itemBuilder: (ContextBuilder context, int index) {
                return Row();
              }),
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back!')),
            ]));
  }
}
