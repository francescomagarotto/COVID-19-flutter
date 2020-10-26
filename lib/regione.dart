// To parse this JSON data, do
//
//     final regione = regioneFromJson(jsonString);

import 'dart:convert';

List<Regione> regioneFromJson(String str) => List<Regione>.from(json.decode(str).map((x) => Regione.fromJson(x)));

String regioneToJson(List<Regione> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Regione {
  Regione({
    this.data,
    this.stato,
    this.codiceRegione,
    this.denominazioneRegione,
    this.lat,
    this.long,
    this.ricoveratiConSintomi,
    this.terapiaIntensiva,
    this.totaleOspedalizzati,
    this.isolamentoDomiciliare,
    this.totalePositivi,
    this.variazioneTotalePositivi,
    this.nuoviPositivi,
    this.dimessiGuariti,
    this.deceduti,
    this.casiDaSospettoDiagnostico,
    this.casiDaScreening,
    this.totaleCasi,
    this.tamponi,
    this.casiTestati,
    this.note,
  });

  DateTime data;
  Stato stato;
  int codiceRegione;
  String denominazioneRegione;
  double lat;
  double long;
  int ricoveratiConSintomi;
  int terapiaIntensiva;
  int totaleOspedalizzati;
  int isolamentoDomiciliare;
  int totalePositivi;
  int variazioneTotalePositivi;
  int nuoviPositivi;
  int dimessiGuariti;
  int deceduti;
  int casiDaSospettoDiagnostico;
  int casiDaScreening;
  int totaleCasi;
  int tamponi;
  int casiTestati;
  dynamic note;

  factory Regione.fromJson(Map<String, dynamic> json) => Regione(
    data: DateTime.parse(json["data"]),
    stato: statoValues.map[json["stato"]],
    codiceRegione: json["codice_regione"],
    denominazioneRegione: json["denominazione_regione"],
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    ricoveratiConSintomi: json["ricoverati_con_sintomi"],
    terapiaIntensiva: json["terapia_intensiva"],
    totaleOspedalizzati: json["totale_ospedalizzati"],
    isolamentoDomiciliare: json["isolamento_domiciliare"],
    totalePositivi: json["totale_positivi"],
    variazioneTotalePositivi: json["variazione_totale_positivi"],
    nuoviPositivi: json["nuovi_positivi"],
    dimessiGuariti: json["dimessi_guariti"],
    deceduti: json["deceduti"],
    casiDaSospettoDiagnostico: json["casi_da_sospetto_diagnostico"],
    casiDaScreening: json["casi_da_screening"],
    totaleCasi: json["totale_casi"],
    tamponi: json["tamponi"],
    casiTestati: json["casi_testati"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toIso8601String(),
    "stato": statoValues.reverse[stato],
    "codice_regione": codiceRegione,
    "denominazione_regione": denominazioneRegione,
    "lat": lat,
    "long": long,
    "ricoverati_con_sintomi": ricoveratiConSintomi,
    "terapia_intensiva": terapiaIntensiva,
    "totale_ospedalizzati": totaleOspedalizzati,
    "isolamento_domiciliare": isolamentoDomiciliare,
    "totale_positivi": totalePositivi,
    "variazione_totale_positivi": variazioneTotalePositivi,
    "nuovi_positivi": nuoviPositivi,
    "dimessi_guariti": dimessiGuariti,
    "deceduti": deceduti,
    "casi_da_sospetto_diagnostico": casiDaSospettoDiagnostico,
    "casi_da_screening": casiDaScreening,
    "totale_casi": totaleCasi,
    "tamponi": tamponi,
    "casi_testati": casiTestati,
    "note": note,
  };
}

enum Stato { ITA }

final statoValues = EnumValues({
  "ITA": Stato.ITA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
