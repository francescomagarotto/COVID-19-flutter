import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/controllers/regioni_controller.dart';
import 'package:flutter_app/models/regione.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SetupPage extends StatefulWidget {
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  List<String> _regioniFavorite;
  final String key = "regioniFavorite";

  void initState() {
    super.initState();
    _loadRegioniFavorite();
  }

  _loadRegioniFavorite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _regioniFavorite = sharedPreferences.getStringList(key) ?? [];
    });
  }

  _updatePreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(key, _regioniFavorite);
  }

  _addRegionePreferita(String _value) async {
    setState(() {
      _regioniFavorite.add(_value);
    });
    _updatePreference();
  }

  _removeRegionePreferita(String _value) async {
    setState(() {
      _regioniFavorite.remove(_value);
    });
    _updatePreference();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Preferenze"),
        ),
        body: FutureBuilder<List<Regione>>(
            future: RegioniController.fetchDatiRegione(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error));
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (cxt, index) {
                      String nome = snapshot.data[index].denominazioneRegione;
                      return CheckboxListTile(
                          title: Text(nome),
                          value: _regioniFavorite.contains(nome),
                          onChanged: (bool value) {
                            (value)
                                ? _addRegionePreferita(nome)
                                : _removeRegionePreferita(nome);
                          });
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
