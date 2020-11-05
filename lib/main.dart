import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/regione.dart';
import 'package:flutter_app/cupertino_card.dart';
import 'package:flutter_app/setup_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/regioni_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Country Data',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Georgia',
      ),
      home: MyHomePage(title: 'COVID-19'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _regioniFavorite;

  void initState() {
    super.initState();
    _getPreferences();
  }

  _getPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.containsKey("regioniFavorite");
    setState(() {
      _regioniFavorite =
          sharedPreferences.getStringList("regioniFavorite") ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Impostazioni',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                ),
              ),
              ListTile(
                title: Text('Preferiti'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SetupPage()));
                },
              ),
            ],
          ),
        ),
        body: (FutureBuilder<List<Regione>>(
          future: RegioniController.fetchDatiRegione(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error);
            if (snapshot.hasData) {
              return (_regioniFavorite != null || _regioniFavorite == [])
                  ? Center(
                      child: Text("Nessun preferito selezionato"),
                    )
                  : ListaRegioni(
                      regioni: snapshot.data.where((regione) => _regioniFavorite
                          .contains(regione.denominazioneRegione)));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )),
      ),
    );
  }
}

class ListaRegioni extends StatelessWidget {
  final List<Regione> regioni;
  ListaRegioni({Key key, this.regioni}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          // Create a grid with 2 columns in portrait mode, or 3 columns in
          // landscape mode.
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(regioni.length, (index) {
            return CupertinoCard(regione: regioni[index]);
          }),
        );
      },
    );
  }
}
