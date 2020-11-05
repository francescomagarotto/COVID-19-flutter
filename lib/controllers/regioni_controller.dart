import 'package:flutter/foundation.dart';
import "package:http/http.dart" show Client;
import '../models/regione.dart';

class RegioniController {
  static Future<List<Regione>> fetchDatiRegione(Client client) async {
    final response = await client.get(
        'https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-regioni-latest.json');
    return compute(regioneFromJson, response.body);
  }
}
