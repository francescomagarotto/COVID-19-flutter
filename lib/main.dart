import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/regione.dart';
import 'package:flutter_app/cupertino_card.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
void main() {
  runApp(MyApp());
}

Future<List<Regione>> fetchDatiRegione(http.Client client) async {
  final response = await client
      .get('https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-regioni-latest.json');

  return compute(regioneFromJson, response.body);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Country Data',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body:
          FutureBuilder<List<Regione>>(
            future: fetchDatiRegione(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text(snapshot.error);
              if (snapshot.hasData) {

                return ListaRegioni(regioni: snapshot.data);
              }
              else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ),
      ),
    );
  }
}

class ListaRegioni extends StatelessWidget {
  List<Regione> regioni;
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
