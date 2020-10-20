import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/coronadata.dart';
import 'package:flutter_app/cupertino_card.dart';
import 'package:flutter_app/state_name.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

/*class CountryData {
  String dateRep;
  String day;
  String month, year;
  int cases;
  int deaths;
  String countriesAndTerritories;
  String countryterritoryCode;

  CountryData({this.dateRep, this.day, this.month, this.year, this.cases,
      this.deaths, this.countriesAndTerritories, this.countryterritoryCode});

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
        dateRep: json['dateRep'] as String,
        day: json['day'] as String,
        month: json['month'] as String,
        year: json['year'] as String,
        cases: json['cases'] as int,
        deaths: json['deaths'] as int,
        countriesAndTerritories: json['countriesAndTerritories'] as String,
        countryterritoryCode: json['countryterritoryCode'] as String );
  }
}
List<CountryData> parseCountryData(String responseBody) {

  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  print(parsed["records"]);
  return parsed["records"].map<CountryData>((json) => CountryData.fromJson(json)).toList();
}*/
Future<CoronaData> fetchCoronaData(http.Client client) async {
  final response = await client
      .get('https://opendata.ecdc.europa.eu/covid19/casedistribution/json/');

  return compute(coronaDataFromJson, response.body);
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: FutureBuilder<CoronaData>(
          future: fetchCoronaData(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? CountryList(
                    records: snapshot.data.records
                        .where((element) =>
                            element.dateRep ==
                            DateFormat('dd/MM/yyyy')
                                .format(DateTime.now())
                                .toString())
                        .toList())
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class CountryList extends StatelessWidget {
  final List<Record> records;
  CountryList({Key key, this.records}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: records.length,
      itemBuilder: (context, index) {
        return CupertinoCard(stateName:records[index].countriesAndTerritories.toString());
      },
    );
  }
}
