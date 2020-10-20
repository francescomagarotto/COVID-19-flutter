import 'dart:convert';

CoronaData coronaDataFromJson(String str) => CoronaData.fromJson(json.decode(str));

String coronaDataToJson(CoronaData data) => json.encode(data.toJson());

class CoronaData {
  CoronaData({
    this.records,
  });

  List<Record> records;

  factory CoronaData.fromJson(Map<String, dynamic> json) => CoronaData(
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}

class Record {
  Record({
    this.dateRep,
    this.day,
    this.month,
    this.year,
    this.cases,
    this.deaths,
    this.countriesAndTerritories,
    this.geoId,
    this.countryterritoryCode,
    this.popData2019,
    this.continentExp,
    this.cumulativeNumberFor14DaysOfCovid19CasesPer100000,
  });

  String dateRep;
  String day;
  String month;
  String year;
  int cases;
  int deaths;
  CountriesAndTerritories countriesAndTerritories;
  GeoId geoId;
  CountryterritoryCode countryterritoryCode;
  int popData2019;
  ContinentExp continentExp;
  String cumulativeNumberFor14DaysOfCovid19CasesPer100000;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    dateRep: json["dateRep"],
    day: json["day"],
    month: json["month"],
    year: json["year"],
    cases: json["cases"],
    deaths: json["deaths"],
    countriesAndTerritories: countriesAndTerritoriesValues.map[json["countriesAndTerritories"]],
    geoId: geoIdValues.map[json["geoId"]],
    countryterritoryCode: json["countryterritoryCode"] == null ? null : countryterritoryCodeValues.map[json["countryterritoryCode"]],
    popData2019: json["popData2019"] == null ? null : json["popData2019"],
    continentExp: continentExpValues.map[json["continentExp"]],
    cumulativeNumberFor14DaysOfCovid19CasesPer100000: json["Cumulative_number_for_14_days_of_COVID-19_cases_per_100000"],
  );

  Map<String, dynamic> toJson() => {
    "dateRep": dateRep,
    "day": day,
    "month": month,
    "year": year,
    "cases": cases,
    "deaths": deaths,
    "countriesAndTerritories": countriesAndTerritoriesValues.reverse[countriesAndTerritories],
    "geoId": geoIdValues.reverse[geoId],
    "countryterritoryCode": countryterritoryCode == null ? null : countryterritoryCodeValues.reverse[countryterritoryCode],
    "popData2019": popData2019 == null ? null : popData2019,
    "continentExp": continentExpValues.reverse[continentExp],
    "Cumulative_number_for_14_days_of_COVID-19_cases_per_100000": cumulativeNumberFor14DaysOfCovid19CasesPer100000,
  };
}

enum ContinentExp { ASIA, EUROPE, AFRICA, AMERICA, OCEANIA, OTHER }

final continentExpValues = EnumValues({
  "Africa": ContinentExp.AFRICA,
  "America": ContinentExp.AMERICA,
  "Asia": ContinentExp.ASIA,
  "Europe": ContinentExp.EUROPE,
  "Oceania": ContinentExp.OCEANIA,
  "Other": ContinentExp.OTHER
});

enum CountriesAndTerritories { AFGHANISTAN, ALBANIA, ALGERIA, ANDORRA, ANGOLA, ANGUILLA, ANTIGUA_AND_BARBUDA, ARGENTINA, ARMENIA, ARUBA, AUSTRALIA, AUSTRIA, AZERBAIJAN, BAHAMAS, BAHRAIN, BANGLADESH, BARBADOS, BELARUS, BELGIUM, BELIZE, BENIN, BERMUDA, BHUTAN, BOLIVIA, BONAIRE_SAINT_EUSTATIUS_AND_SABA, BOSNIA_AND_HERZEGOVINA, BOTSWANA, BRAZIL, BRITISH_VIRGIN_ISLANDS, BRUNEI_DARUSSALAM, BULGARIA, BURKINA_FASO, BURUNDI, CAMBODIA, CAMEROON, CANADA, CAPE_VERDE, CASES_ON_AN_INTERNATIONAL_CONVEYANCE_JAPAN, CAYMAN_ISLANDS, CENTRAL_AFRICAN_REPUBLIC, CHAD, CHILE, CHINA, COLOMBIA, COMOROS, CONGO, COSTA_RICA, COTE_D_IVOIRE, CROATIA, CUBA, CURAAO, CYPRUS, CZECHIA, DEMOCRATIC_REPUBLIC_OF_THE_CONGO, DENMARK, DJIBOUTI, DOMINICA, DOMINICAN_REPUBLIC, ECUADOR, EGYPT, EL_SALVADOR, EQUATORIAL_GUINEA, ERITREA, ESTONIA, ESWATINI, ETHIOPIA, FALKLAND_ISLANDS_MALVINAS, FAROE_ISLANDS, FIJI, FINLAND, FRANCE, FRENCH_POLYNESIA, GABON, GAMBIA, GEORGIA, GERMANY, GHANA, GIBRALTAR, GREECE, GREENLAND, GRENADA, GUAM, GUATEMALA, GUERNSEY, GUINEA, GUINEA_BISSAU, GUYANA, HAITI, HOLY_SEE, HONDURAS, HUNGARY, ICELAND, INDIA, INDONESIA, IRAN, IRAQ, IRELAND, ISLE_OF_MAN, ISRAEL, ITALY, JAMAICA, JAPAN, JERSEY, JORDAN, KAZAKHSTAN, KENYA, KOSOVO, KUWAIT, KYRGYZSTAN, LAOS, LATVIA, LEBANON, LESOTHO, LIBERIA, LIBYA, LIECHTENSTEIN, LITHUANIA, LUXEMBOURG, MADAGASCAR, MALAWI, MALAYSIA, MALDIVES, MALI, MALTA, MAURITANIA, MAURITIUS, MEXICO, MOLDOVA, MONACO, MONGOLIA, MONTENEGRO, MONTSERRAT, MOROCCO, MOZAMBIQUE, MYANMAR, NAMIBIA, NEPAL, NETHERLANDS, NEW_CALEDONIA, NEW_ZEALAND, NICARAGUA, NIGER, NIGERIA, NORTH_MACEDONIA, NORTHERN_MARIANA_ISLANDS, NORWAY, OMAN, PAKISTAN, PALESTINE, PANAMA, PAPUA_NEW_GUINEA, PARAGUAY, PERU, PHILIPPINES, POLAND, PORTUGAL, PUERTO_RICO, QATAR, ROMANIA, RUSSIA, RWANDA, SAINT_KITTS_AND_NEVIS, SAINT_LUCIA, SAINT_VINCENT_AND_THE_GRENADINES, SAN_MARINO, SAO_TOME_AND_PRINCIPE, SAUDI_ARABIA, SENEGAL, SERBIA, SEYCHELLES, SIERRA_LEONE, SINGAPORE, SINT_MAARTEN, SLOVAKIA, SLOVENIA, SOLOMON_ISLANDS, SOMALIA, SOUTH_AFRICA, SOUTH_KOREA, SOUTH_SUDAN, SPAIN, SRI_LANKA, SUDAN, SURINAME, SWEDEN, SWITZERLAND, SYRIA, TAIWAN, TAJIKISTAN, THAILAND, TIMOR_LESTE, TOGO, TRINIDAD_AND_TOBAGO, TUNISIA, TURKEY, TURKS_AND_CAICOS_ISLANDS, UGANDA, UKRAINE, UNITED_ARAB_EMIRATES, UNITED_KINGDOM, UNITED_REPUBLIC_OF_TANZANIA, UNITED_STATES_OF_AMERICA, UNITED_STATES_VIRGIN_ISLANDS, URUGUAY, UZBEKISTAN, VENEZUELA, VIETNAM, WESTERN_SAHARA, YEMEN, ZAMBIA, ZIMBABWE }

final countriesAndTerritoriesValues = EnumValues({
  "Afghanistan": CountriesAndTerritories.AFGHANISTAN,
  "Albania": CountriesAndTerritories.ALBANIA,
  "Algeria": CountriesAndTerritories.ALGERIA,
  "Andorra": CountriesAndTerritories.ANDORRA,
  "Angola": CountriesAndTerritories.ANGOLA,
  "Anguilla": CountriesAndTerritories.ANGUILLA,
  "Antigua_and_Barbuda": CountriesAndTerritories.ANTIGUA_AND_BARBUDA,
  "Argentina": CountriesAndTerritories.ARGENTINA,
  "Armenia": CountriesAndTerritories.ARMENIA,
  "Aruba": CountriesAndTerritories.ARUBA,
  "Australia": CountriesAndTerritories.AUSTRALIA,
  "Austria": CountriesAndTerritories.AUSTRIA,
  "Azerbaijan": CountriesAndTerritories.AZERBAIJAN,
  "Bahamas": CountriesAndTerritories.BAHAMAS,
  "Bahrain": CountriesAndTerritories.BAHRAIN,
  "Bangladesh": CountriesAndTerritories.BANGLADESH,
  "Barbados": CountriesAndTerritories.BARBADOS,
  "Belarus": CountriesAndTerritories.BELARUS,
  "Belgium": CountriesAndTerritories.BELGIUM,
  "Belize": CountriesAndTerritories.BELIZE,
  "Benin": CountriesAndTerritories.BENIN,
  "Bermuda": CountriesAndTerritories.BERMUDA,
  "Bhutan": CountriesAndTerritories.BHUTAN,
  "Bolivia": CountriesAndTerritories.BOLIVIA,
  "Bonaire, Saint Eustatius and Saba": CountriesAndTerritories.BONAIRE_SAINT_EUSTATIUS_AND_SABA,
  "Bosnia_and_Herzegovina": CountriesAndTerritories.BOSNIA_AND_HERZEGOVINA,
  "Botswana": CountriesAndTerritories.BOTSWANA,
  "Brazil": CountriesAndTerritories.BRAZIL,
  "British_Virgin_Islands": CountriesAndTerritories.BRITISH_VIRGIN_ISLANDS,
  "Brunei_Darussalam": CountriesAndTerritories.BRUNEI_DARUSSALAM,
  "Bulgaria": CountriesAndTerritories.BULGARIA,
  "Burkina_Faso": CountriesAndTerritories.BURKINA_FASO,
  "Burundi": CountriesAndTerritories.BURUNDI,
  "Cambodia": CountriesAndTerritories.CAMBODIA,
  "Cameroon": CountriesAndTerritories.CAMEROON,
  "Canada": CountriesAndTerritories.CANADA,
  "Cape_Verde": CountriesAndTerritories.CAPE_VERDE,
  "Cases_on_an_international_conveyance_Japan": CountriesAndTerritories.CASES_ON_AN_INTERNATIONAL_CONVEYANCE_JAPAN,
  "Cayman_Islands": CountriesAndTerritories.CAYMAN_ISLANDS,
  "Central_African_Republic": CountriesAndTerritories.CENTRAL_AFRICAN_REPUBLIC,
  "Chad": CountriesAndTerritories.CHAD,
  "Chile": CountriesAndTerritories.CHILE,
  "China": CountriesAndTerritories.CHINA,
  "Colombia": CountriesAndTerritories.COLOMBIA,
  "Comoros": CountriesAndTerritories.COMOROS,
  "Congo": CountriesAndTerritories.CONGO,
  "Costa_Rica": CountriesAndTerritories.COSTA_RICA,
  "Cote_dIvoire": CountriesAndTerritories.COTE_D_IVOIRE,
  "Croatia": CountriesAndTerritories.CROATIA,
  "Cuba": CountriesAndTerritories.CUBA,
  "Curaçao": CountriesAndTerritories.CURAAO,
  "Cyprus": CountriesAndTerritories.CYPRUS,
  "Czechia": CountriesAndTerritories.CZECHIA,
  "Democratic_Republic_of_the_Congo": CountriesAndTerritories.DEMOCRATIC_REPUBLIC_OF_THE_CONGO,
  "Denmark": CountriesAndTerritories.DENMARK,
  "Djibouti": CountriesAndTerritories.DJIBOUTI,
  "Dominica": CountriesAndTerritories.DOMINICA,
  "Dominican_Republic": CountriesAndTerritories.DOMINICAN_REPUBLIC,
  "Ecuador": CountriesAndTerritories.ECUADOR,
  "Egypt": CountriesAndTerritories.EGYPT,
  "El_Salvador": CountriesAndTerritories.EL_SALVADOR,
  "Equatorial_Guinea": CountriesAndTerritories.EQUATORIAL_GUINEA,
  "Eritrea": CountriesAndTerritories.ERITREA,
  "Estonia": CountriesAndTerritories.ESTONIA,
  "Eswatini": CountriesAndTerritories.ESWATINI,
  "Ethiopia": CountriesAndTerritories.ETHIOPIA,
  "Falkland_Islands_(Malvinas)": CountriesAndTerritories.FALKLAND_ISLANDS_MALVINAS,
  "Faroe_Islands": CountriesAndTerritories.FAROE_ISLANDS,
  "Fiji": CountriesAndTerritories.FIJI,
  "Finland": CountriesAndTerritories.FINLAND,
  "France": CountriesAndTerritories.FRANCE,
  "French_Polynesia": CountriesAndTerritories.FRENCH_POLYNESIA,
  "Gabon": CountriesAndTerritories.GABON,
  "Gambia": CountriesAndTerritories.GAMBIA,
  "Georgia": CountriesAndTerritories.GEORGIA,
  "Germany": CountriesAndTerritories.GERMANY,
  "Ghana": CountriesAndTerritories.GHANA,
  "Gibraltar": CountriesAndTerritories.GIBRALTAR,
  "Greece": CountriesAndTerritories.GREECE,
  "Greenland": CountriesAndTerritories.GREENLAND,
  "Grenada": CountriesAndTerritories.GRENADA,
  "Guam": CountriesAndTerritories.GUAM,
  "Guatemala": CountriesAndTerritories.GUATEMALA,
  "Guernsey": CountriesAndTerritories.GUERNSEY,
  "Guinea": CountriesAndTerritories.GUINEA,
  "Guinea_Bissau": CountriesAndTerritories.GUINEA_BISSAU,
  "Guyana": CountriesAndTerritories.GUYANA,
  "Haiti": CountriesAndTerritories.HAITI,
  "Holy_See": CountriesAndTerritories.HOLY_SEE,
  "Honduras": CountriesAndTerritories.HONDURAS,
  "Hungary": CountriesAndTerritories.HUNGARY,
  "Iceland": CountriesAndTerritories.ICELAND,
  "India": CountriesAndTerritories.INDIA,
  "Indonesia": CountriesAndTerritories.INDONESIA,
  "Iran": CountriesAndTerritories.IRAN,
  "Iraq": CountriesAndTerritories.IRAQ,
  "Ireland": CountriesAndTerritories.IRELAND,
  "Isle_of_Man": CountriesAndTerritories.ISLE_OF_MAN,
  "Israel": CountriesAndTerritories.ISRAEL,
  "Italy": CountriesAndTerritories.ITALY,
  "Jamaica": CountriesAndTerritories.JAMAICA,
  "Japan": CountriesAndTerritories.JAPAN,
  "Jersey": CountriesAndTerritories.JERSEY,
  "Jordan": CountriesAndTerritories.JORDAN,
  "Kazakhstan": CountriesAndTerritories.KAZAKHSTAN,
  "Kenya": CountriesAndTerritories.KENYA,
  "Kosovo": CountriesAndTerritories.KOSOVO,
  "Kuwait": CountriesAndTerritories.KUWAIT,
  "Kyrgyzstan": CountriesAndTerritories.KYRGYZSTAN,
  "Laos": CountriesAndTerritories.LAOS,
  "Latvia": CountriesAndTerritories.LATVIA,
  "Lebanon": CountriesAndTerritories.LEBANON,
  "Lesotho": CountriesAndTerritories.LESOTHO,
  "Liberia": CountriesAndTerritories.LIBERIA,
  "Libya": CountriesAndTerritories.LIBYA,
  "Liechtenstein": CountriesAndTerritories.LIECHTENSTEIN,
  "Lithuania": CountriesAndTerritories.LITHUANIA,
  "Luxembourg": CountriesAndTerritories.LUXEMBOURG,
  "Madagascar": CountriesAndTerritories.MADAGASCAR,
  "Malawi": CountriesAndTerritories.MALAWI,
  "Malaysia": CountriesAndTerritories.MALAYSIA,
  "Maldives": CountriesAndTerritories.MALDIVES,
  "Mali": CountriesAndTerritories.MALI,
  "Malta": CountriesAndTerritories.MALTA,
  "Mauritania": CountriesAndTerritories.MAURITANIA,
  "Mauritius": CountriesAndTerritories.MAURITIUS,
  "Mexico": CountriesAndTerritories.MEXICO,
  "Moldova": CountriesAndTerritories.MOLDOVA,
  "Monaco": CountriesAndTerritories.MONACO,
  "Mongolia": CountriesAndTerritories.MONGOLIA,
  "Montenegro": CountriesAndTerritories.MONTENEGRO,
  "Montserrat": CountriesAndTerritories.MONTSERRAT,
  "Morocco": CountriesAndTerritories.MOROCCO,
  "Mozambique": CountriesAndTerritories.MOZAMBIQUE,
  "Myanmar": CountriesAndTerritories.MYANMAR,
  "Namibia": CountriesAndTerritories.NAMIBIA,
  "Nepal": CountriesAndTerritories.NEPAL,
  "Netherlands": CountriesAndTerritories.NETHERLANDS,
  "New_Caledonia": CountriesAndTerritories.NEW_CALEDONIA,
  "New_Zealand": CountriesAndTerritories.NEW_ZEALAND,
  "Nicaragua": CountriesAndTerritories.NICARAGUA,
  "Niger": CountriesAndTerritories.NIGER,
  "Nigeria": CountriesAndTerritories.NIGERIA,
  "Northern_Mariana_Islands": CountriesAndTerritories.NORTHERN_MARIANA_ISLANDS,
  "North_Macedonia": CountriesAndTerritories.NORTH_MACEDONIA,
  "Norway": CountriesAndTerritories.NORWAY,
  "Oman": CountriesAndTerritories.OMAN,
  "Pakistan": CountriesAndTerritories.PAKISTAN,
  "Palestine": CountriesAndTerritories.PALESTINE,
  "Panama": CountriesAndTerritories.PANAMA,
  "Papua_New_Guinea": CountriesAndTerritories.PAPUA_NEW_GUINEA,
  "Paraguay": CountriesAndTerritories.PARAGUAY,
  "Peru": CountriesAndTerritories.PERU,
  "Philippines": CountriesAndTerritories.PHILIPPINES,
  "Poland": CountriesAndTerritories.POLAND,
  "Portugal": CountriesAndTerritories.PORTUGAL,
  "Puerto_Rico": CountriesAndTerritories.PUERTO_RICO,
  "Qatar": CountriesAndTerritories.QATAR,
  "Romania": CountriesAndTerritories.ROMANIA,
  "Russia": CountriesAndTerritories.RUSSIA,
  "Rwanda": CountriesAndTerritories.RWANDA,
  "Saint_Kitts_and_Nevis": CountriesAndTerritories.SAINT_KITTS_AND_NEVIS,
  "Saint_Lucia": CountriesAndTerritories.SAINT_LUCIA,
  "Saint_Vincent_and_the_Grenadines": CountriesAndTerritories.SAINT_VINCENT_AND_THE_GRENADINES,
  "San_Marino": CountriesAndTerritories.SAN_MARINO,
  "Sao_Tome_and_Principe": CountriesAndTerritories.SAO_TOME_AND_PRINCIPE,
  "Saudi_Arabia": CountriesAndTerritories.SAUDI_ARABIA,
  "Senegal": CountriesAndTerritories.SENEGAL,
  "Serbia": CountriesAndTerritories.SERBIA,
  "Seychelles": CountriesAndTerritories.SEYCHELLES,
  "Sierra_Leone": CountriesAndTerritories.SIERRA_LEONE,
  "Singapore": CountriesAndTerritories.SINGAPORE,
  "Sint_Maarten": CountriesAndTerritories.SINT_MAARTEN,
  "Slovakia": CountriesAndTerritories.SLOVAKIA,
  "Slovenia": CountriesAndTerritories.SLOVENIA,
  "Solomon_Islands": CountriesAndTerritories.SOLOMON_ISLANDS,
  "Somalia": CountriesAndTerritories.SOMALIA,
  "South_Africa": CountriesAndTerritories.SOUTH_AFRICA,
  "South_Korea": CountriesAndTerritories.SOUTH_KOREA,
  "South_Sudan": CountriesAndTerritories.SOUTH_SUDAN,
  "Spain": CountriesAndTerritories.SPAIN,
  "Sri_Lanka": CountriesAndTerritories.SRI_LANKA,
  "Sudan": CountriesAndTerritories.SUDAN,
  "Suriname": CountriesAndTerritories.SURINAME,
  "Sweden": CountriesAndTerritories.SWEDEN,
  "Switzerland": CountriesAndTerritories.SWITZERLAND,
  "Syria": CountriesAndTerritories.SYRIA,
  "Taiwan": CountriesAndTerritories.TAIWAN,
  "Tajikistan": CountriesAndTerritories.TAJIKISTAN,
  "Thailand": CountriesAndTerritories.THAILAND,
  "Timor_Leste": CountriesAndTerritories.TIMOR_LESTE,
  "Togo": CountriesAndTerritories.TOGO,
  "Trinidad_and_Tobago": CountriesAndTerritories.TRINIDAD_AND_TOBAGO,
  "Tunisia": CountriesAndTerritories.TUNISIA,
  "Turkey": CountriesAndTerritories.TURKEY,
  "Turks_and_Caicos_islands": CountriesAndTerritories.TURKS_AND_CAICOS_ISLANDS,
  "Uganda": CountriesAndTerritories.UGANDA,
  "Ukraine": CountriesAndTerritories.UKRAINE,
  "United_Arab_Emirates": CountriesAndTerritories.UNITED_ARAB_EMIRATES,
  "United_Kingdom": CountriesAndTerritories.UNITED_KINGDOM,
  "United_Republic_of_Tanzania": CountriesAndTerritories.UNITED_REPUBLIC_OF_TANZANIA,
  "United_States_of_America": CountriesAndTerritories.UNITED_STATES_OF_AMERICA,
  "United_States_Virgin_Islands": CountriesAndTerritories.UNITED_STATES_VIRGIN_ISLANDS,
  "Uruguay": CountriesAndTerritories.URUGUAY,
  "Uzbekistan": CountriesAndTerritories.UZBEKISTAN,
  "Venezuela": CountriesAndTerritories.VENEZUELA,
  "Vietnam": CountriesAndTerritories.VIETNAM,
  "Western_Sahara": CountriesAndTerritories.WESTERN_SAHARA,
  "Yemen": CountriesAndTerritories.YEMEN,
  "Zambia": CountriesAndTerritories.ZAMBIA,
  "Zimbabwe": CountriesAndTerritories.ZIMBABWE
});

enum CountryterritoryCode { AFG, ALB, DZA, AND, AGO, AIA, ATG, ARG, ARM, ABW, AUS, AUT, AZE, BHS, BHR, BGD, BRB, BLR, BEL, BLZ, BEN, BMU, BTN, BOL, BES, BIH, BWA, BRA, VGB, BRN, BGR, BFA, BDI, KHM, CMR, CAN, CPV, CYM, CAF, TCD, CHL, CHN, COL, COM, COG, CRI, CIV, HRV, CUB, CUW, CYP, CZE, COD, DNK, DJI, DMA, DOM, ECU, EGY, SLV, GNQ, ERI, EST, SWZ, ETH, FLK, FRO, FJI, FIN, FRA, PYF, GAB, GMB, GEO, DEU, GHA, GIB, GRC, GRL, GRD, GUM, GTM, GGY, GIN, GNB, GUY, HTI, VAT, HND, HUN, ISL, IND, IDN, IRN, IRQ, IRL, IMN, ISR, ITA, JAM, JPN, JEY, JOR, KAZ, KEN, XKX, KWT, KGZ, LAO, LVA, LBN, LSO, LBR, LBY, LIE, LTU, LUX, MDG, MWI, MYS, MDV, MLI, MLT, MRT, MUS, MEX, MDA, MCO, MNG, MNE, MSF, MAR, MOZ, MMR, NAM, NPL, NLD, NCL, NZL, NIC, NER, NGA, MKD, MNP, NOR, OMN, PAK, PSE, PAN, PNG, PRY, PER, PHL, POL, PRT, PRI, QAT, ROU, RUS, RWA, KNA, LCA, VCT, SMR, STP, SAU, SEN, SRB, SYC, SLE, SGP, SXM, SVK, SVN, SLB, SOM, ZAF, KOR, SSD, ESP, LKA, SDN, SUR, SWE, CHE, SYR, CNG1925, TJK, THA, TLS, TGO, TTO, TUN, TUR, TCA, UGA, UKR, ARE, GBR, TZA, USA, VIR, URY, UZB, VEN, VNM, ESH, YEM, ZMB, ZWE }

final countryterritoryCodeValues = EnumValues({
  "ABW": CountryterritoryCode.ABW,
  "AFG": CountryterritoryCode.AFG,
  "AGO": CountryterritoryCode.AGO,
  "AIA": CountryterritoryCode.AIA,
  "ALB": CountryterritoryCode.ALB,
  "AND": CountryterritoryCode.AND,
  "ARE": CountryterritoryCode.ARE,
  "ARG": CountryterritoryCode.ARG,
  "ARM": CountryterritoryCode.ARM,
  "ATG": CountryterritoryCode.ATG,
  "AUS": CountryterritoryCode.AUS,
  "AUT": CountryterritoryCode.AUT,
  "AZE": CountryterritoryCode.AZE,
  "BDI": CountryterritoryCode.BDI,
  "BEL": CountryterritoryCode.BEL,
  "BEN": CountryterritoryCode.BEN,
  "BES": CountryterritoryCode.BES,
  "BFA": CountryterritoryCode.BFA,
  "BGD": CountryterritoryCode.BGD,
  "BGR": CountryterritoryCode.BGR,
  "BHR": CountryterritoryCode.BHR,
  "BHS": CountryterritoryCode.BHS,
  "BIH": CountryterritoryCode.BIH,
  "BLR": CountryterritoryCode.BLR,
  "BLZ": CountryterritoryCode.BLZ,
  "BMU": CountryterritoryCode.BMU,
  "BOL": CountryterritoryCode.BOL,
  "BRA": CountryterritoryCode.BRA,
  "BRB": CountryterritoryCode.BRB,
  "BRN": CountryterritoryCode.BRN,
  "BTN": CountryterritoryCode.BTN,
  "BWA": CountryterritoryCode.BWA,
  "CAF": CountryterritoryCode.CAF,
  "CAN": CountryterritoryCode.CAN,
  "CHE": CountryterritoryCode.CHE,
  "CHL": CountryterritoryCode.CHL,
  "CHN": CountryterritoryCode.CHN,
  "CIV": CountryterritoryCode.CIV,
  "CMR": CountryterritoryCode.CMR,
  "CNG1925": CountryterritoryCode.CNG1925,
  "COD": CountryterritoryCode.COD,
  "COG": CountryterritoryCode.COG,
  "COL": CountryterritoryCode.COL,
  "COM": CountryterritoryCode.COM,
  "CPV": CountryterritoryCode.CPV,
  "CRI": CountryterritoryCode.CRI,
  "CUB": CountryterritoryCode.CUB,
  "CUW": CountryterritoryCode.CUW,
  "CYM": CountryterritoryCode.CYM,
  "CYP": CountryterritoryCode.CYP,
  "CZE": CountryterritoryCode.CZE,
  "DEU": CountryterritoryCode.DEU,
  "DJI": CountryterritoryCode.DJI,
  "DMA": CountryterritoryCode.DMA,
  "DNK": CountryterritoryCode.DNK,
  "DOM": CountryterritoryCode.DOM,
  "DZA": CountryterritoryCode.DZA,
  "ECU": CountryterritoryCode.ECU,
  "EGY": CountryterritoryCode.EGY,
  "ERI": CountryterritoryCode.ERI,
  "ESH": CountryterritoryCode.ESH,
  "ESP": CountryterritoryCode.ESP,
  "EST": CountryterritoryCode.EST,
  "ETH": CountryterritoryCode.ETH,
  "FIN": CountryterritoryCode.FIN,
  "FJI": CountryterritoryCode.FJI,
  "FLK": CountryterritoryCode.FLK,
  "FRA": CountryterritoryCode.FRA,
  "FRO": CountryterritoryCode.FRO,
  "GAB": CountryterritoryCode.GAB,
  "GBR": CountryterritoryCode.GBR,
  "GEO": CountryterritoryCode.GEO,
  "GGY": CountryterritoryCode.GGY,
  "GHA": CountryterritoryCode.GHA,
  "GIB": CountryterritoryCode.GIB,
  "GIN": CountryterritoryCode.GIN,
  "GMB": CountryterritoryCode.GMB,
  "GNB": CountryterritoryCode.GNB,
  "GNQ": CountryterritoryCode.GNQ,
  "GRC": CountryterritoryCode.GRC,
  "GRD": CountryterritoryCode.GRD,
  "GRL": CountryterritoryCode.GRL,
  "GTM": CountryterritoryCode.GTM,
  "GUM": CountryterritoryCode.GUM,
  "GUY": CountryterritoryCode.GUY,
  "HND": CountryterritoryCode.HND,
  "HRV": CountryterritoryCode.HRV,
  "HTI": CountryterritoryCode.HTI,
  "HUN": CountryterritoryCode.HUN,
  "IDN": CountryterritoryCode.IDN,
  "IMN": CountryterritoryCode.IMN,
  "IND": CountryterritoryCode.IND,
  "IRL": CountryterritoryCode.IRL,
  "IRN": CountryterritoryCode.IRN,
  "IRQ": CountryterritoryCode.IRQ,
  "ISL": CountryterritoryCode.ISL,
  "ISR": CountryterritoryCode.ISR,
  "ITA": CountryterritoryCode.ITA,
  "JAM": CountryterritoryCode.JAM,
  "JEY": CountryterritoryCode.JEY,
  "JOR": CountryterritoryCode.JOR,
  "JPN": CountryterritoryCode.JPN,
  "KAZ": CountryterritoryCode.KAZ,
  "KEN": CountryterritoryCode.KEN,
  "KGZ": CountryterritoryCode.KGZ,
  "KHM": CountryterritoryCode.KHM,
  "KNA": CountryterritoryCode.KNA,
  "KOR": CountryterritoryCode.KOR,
  "KWT": CountryterritoryCode.KWT,
  "LAO": CountryterritoryCode.LAO,
  "LBN": CountryterritoryCode.LBN,
  "LBR": CountryterritoryCode.LBR,
  "LBY": CountryterritoryCode.LBY,
  "LCA": CountryterritoryCode.LCA,
  "LIE": CountryterritoryCode.LIE,
  "LKA": CountryterritoryCode.LKA,
  "LSO": CountryterritoryCode.LSO,
  "LTU": CountryterritoryCode.LTU,
  "LUX": CountryterritoryCode.LUX,
  "LVA": CountryterritoryCode.LVA,
  "MAR": CountryterritoryCode.MAR,
  "MCO": CountryterritoryCode.MCO,
  "MDA": CountryterritoryCode.MDA,
  "MDG": CountryterritoryCode.MDG,
  "MDV": CountryterritoryCode.MDV,
  "MEX": CountryterritoryCode.MEX,
  "MKD": CountryterritoryCode.MKD,
  "MLI": CountryterritoryCode.MLI,
  "MLT": CountryterritoryCode.MLT,
  "MMR": CountryterritoryCode.MMR,
  "MNE": CountryterritoryCode.MNE,
  "MNG": CountryterritoryCode.MNG,
  "MNP": CountryterritoryCode.MNP,
  "MOZ": CountryterritoryCode.MOZ,
  "MRT": CountryterritoryCode.MRT,
  "MSF": CountryterritoryCode.MSF,
  "MUS": CountryterritoryCode.MUS,
  "MWI": CountryterritoryCode.MWI,
  "MYS": CountryterritoryCode.MYS,
  "NAM": CountryterritoryCode.NAM,
  "NCL": CountryterritoryCode.NCL,
  "NER": CountryterritoryCode.NER,
  "NGA": CountryterritoryCode.NGA,
  "NIC": CountryterritoryCode.NIC,
  "NLD": CountryterritoryCode.NLD,
  "NOR": CountryterritoryCode.NOR,
  "NPL": CountryterritoryCode.NPL,
  "NZL": CountryterritoryCode.NZL,
  "OMN": CountryterritoryCode.OMN,
  "PAK": CountryterritoryCode.PAK,
  "PAN": CountryterritoryCode.PAN,
  "PER": CountryterritoryCode.PER,
  "PHL": CountryterritoryCode.PHL,
  "PNG": CountryterritoryCode.PNG,
  "POL": CountryterritoryCode.POL,
  "PRI": CountryterritoryCode.PRI,
  "PRT": CountryterritoryCode.PRT,
  "PRY": CountryterritoryCode.PRY,
  "PSE": CountryterritoryCode.PSE,
  "PYF": CountryterritoryCode.PYF,
  "QAT": CountryterritoryCode.QAT,
  "ROU": CountryterritoryCode.ROU,
  "RUS": CountryterritoryCode.RUS,
  "RWA": CountryterritoryCode.RWA,
  "SAU": CountryterritoryCode.SAU,
  "SDN": CountryterritoryCode.SDN,
  "SEN": CountryterritoryCode.SEN,
  "SGP": CountryterritoryCode.SGP,
  "SLB": CountryterritoryCode.SLB,
  "SLE": CountryterritoryCode.SLE,
  "SLV": CountryterritoryCode.SLV,
  "SMR": CountryterritoryCode.SMR,
  "SOM": CountryterritoryCode.SOM,
  "SRB": CountryterritoryCode.SRB,
  "SSD": CountryterritoryCode.SSD,
  "STP": CountryterritoryCode.STP,
  "SUR": CountryterritoryCode.SUR,
  "SVK": CountryterritoryCode.SVK,
  "SVN": CountryterritoryCode.SVN,
  "SWE": CountryterritoryCode.SWE,
  "SWZ": CountryterritoryCode.SWZ,
  "SXM": CountryterritoryCode.SXM,
  "SYC": CountryterritoryCode.SYC,
  "SYR": CountryterritoryCode.SYR,
  "TCA": CountryterritoryCode.TCA,
  "TCD": CountryterritoryCode.TCD,
  "TGO": CountryterritoryCode.TGO,
  "THA": CountryterritoryCode.THA,
  "TJK": CountryterritoryCode.TJK,
  "TLS": CountryterritoryCode.TLS,
  "TTO": CountryterritoryCode.TTO,
  "TUN": CountryterritoryCode.TUN,
  "TUR": CountryterritoryCode.TUR,
  "TZA": CountryterritoryCode.TZA,
  "UGA": CountryterritoryCode.UGA,
  "UKR": CountryterritoryCode.UKR,
  "URY": CountryterritoryCode.URY,
  "USA": CountryterritoryCode.USA,
  "UZB": CountryterritoryCode.UZB,
  "VAT": CountryterritoryCode.VAT,
  "VCT": CountryterritoryCode.VCT,
  "VEN": CountryterritoryCode.VEN,
  "VGB": CountryterritoryCode.VGB,
  "VIR": CountryterritoryCode.VIR,
  "VNM": CountryterritoryCode.VNM,
  "XKX": CountryterritoryCode.XKX,
  "YEM": CountryterritoryCode.YEM,
  "ZAF": CountryterritoryCode.ZAF,
  "ZMB": CountryterritoryCode.ZMB,
  "ZWE": CountryterritoryCode.ZWE
});

enum GeoId { AF, AL, DZ, AD, AO, AI, AG, AR, AM, AW, AU, AT, AZ, BS, BH, BD, BB, BY, BE, BZ, BJ, BM, BT, BO, BQ, BA, BW, BR, VG, BN, BG, BF, BI, KH, CM, CA, CV, JPG11668, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, HR, CU, CW, CY, CZ, CD, DK, DJ, DM, DO, EC, EG, SV, GQ, ER, EE, SZ, ET, FK, FO, FJ, FI, FR, PF, GA, GM, GE, DE, GH, GI, EL, GL, GD, GU, GT, GG, GN, GW, GY, HT, VA, HN, HU, IS, IN, ID, IR, IQ, IE, IM, IL, IT, JM, JP, JE, JO, KZ, KE, XK, KW, KG, LA, LV, LB, LS, LR, LY, LI, LT, LU, MG, MW, MY, MV, ML, MT, MR, MU, MX, MD, MC, MN, ME, MS, MA, MZ, MM, NA, NP, NL, NC, NZ, NI, NE, NG, MK, MP, NO, OM, PK, PS, PA, PG, PY, PE, PH, PL, PT, PR, QA, RO, RU, RW, KN, LC, VC, SM, ST, SA, SN, RS, SC, SL, SG, SX, SK, SI, SB, SO, ZA, KR, SS, ES, LK, SD, SR, SE, CH, SY, TW, TJ, TH, TL, TG, TT, TN, TR, TC, UG, UA, AE, UK, TZ, US, VI, UY, UZ, VE, VN, EH, YE, ZM, ZW }

final geoIdValues = EnumValues({
  "AD": GeoId.AD,
  "AE": GeoId.AE,
  "AF": GeoId.AF,
  "AG": GeoId.AG,
  "AI": GeoId.AI,
  "AL": GeoId.AL,
  "AM": GeoId.AM,
  "AO": GeoId.AO,
  "AR": GeoId.AR,
  "AT": GeoId.AT,
  "AU": GeoId.AU,
  "AW": GeoId.AW,
  "AZ": GeoId.AZ,
  "BA": GeoId.BA,
  "BB": GeoId.BB,
  "BD": GeoId.BD,
  "BE": GeoId.BE,
  "BF": GeoId.BF,
  "BG": GeoId.BG,
  "BH": GeoId.BH,
  "BI": GeoId.BI,
  "BJ": GeoId.BJ,
  "BM": GeoId.BM,
  "BN": GeoId.BN,
  "BO": GeoId.BO,
  "BQ": GeoId.BQ,
  "BR": GeoId.BR,
  "BS": GeoId.BS,
  "BT": GeoId.BT,
  "BW": GeoId.BW,
  "BY": GeoId.BY,
  "BZ": GeoId.BZ,
  "CA": GeoId.CA,
  "CD": GeoId.CD,
  "CF": GeoId.CF,
  "CG": GeoId.CG,
  "CH": GeoId.CH,
  "CI": GeoId.CI,
  "CL": GeoId.CL,
  "CM": GeoId.CM,
  "CN": GeoId.CN,
  "CO": GeoId.CO,
  "CR": GeoId.CR,
  "CU": GeoId.CU,
  "CV": GeoId.CV,
  "CW": GeoId.CW,
  "CY": GeoId.CY,
  "CZ": GeoId.CZ,
  "DE": GeoId.DE,
  "DJ": GeoId.DJ,
  "DK": GeoId.DK,
  "DM": GeoId.DM,
  "DO": GeoId.DO,
  "DZ": GeoId.DZ,
  "EC": GeoId.EC,
  "EE": GeoId.EE,
  "EG": GeoId.EG,
  "EH": GeoId.EH,
  "EL": GeoId.EL,
  "ER": GeoId.ER,
  "ES": GeoId.ES,
  "ET": GeoId.ET,
  "FI": GeoId.FI,
  "FJ": GeoId.FJ,
  "FK": GeoId.FK,
  "FO": GeoId.FO,
  "FR": GeoId.FR,
  "GA": GeoId.GA,
  "GD": GeoId.GD,
  "GE": GeoId.GE,
  "GG": GeoId.GG,
  "GH": GeoId.GH,
  "GI": GeoId.GI,
  "GL": GeoId.GL,
  "GM": GeoId.GM,
  "GN": GeoId.GN,
  "GQ": GeoId.GQ,
  "GT": GeoId.GT,
  "GU": GeoId.GU,
  "GW": GeoId.GW,
  "GY": GeoId.GY,
  "HN": GeoId.HN,
  "HR": GeoId.HR,
  "HT": GeoId.HT,
  "HU": GeoId.HU,
  "ID": GeoId.ID,
  "IE": GeoId.IE,
  "IL": GeoId.IL,
  "IM": GeoId.IM,
  "IN": GeoId.IN,
  "IQ": GeoId.IQ,
  "IR": GeoId.IR,
  "IS": GeoId.IS,
  "IT": GeoId.IT,
  "JE": GeoId.JE,
  "JM": GeoId.JM,
  "JO": GeoId.JO,
  "JP": GeoId.JP,
  "JPG11668": GeoId.JPG11668,
  "KE": GeoId.KE,
  "KG": GeoId.KG,
  "KH": GeoId.KH,
  "KM": GeoId.KM,
  "KN": GeoId.KN,
  "KR": GeoId.KR,
  "KW": GeoId.KW,
  "KY": GeoId.KY,
  "KZ": GeoId.KZ,
  "LA": GeoId.LA,
  "LB": GeoId.LB,
  "LC": GeoId.LC,
  "LI": GeoId.LI,
  "LK": GeoId.LK,
  "LR": GeoId.LR,
  "LS": GeoId.LS,
  "LT": GeoId.LT,
  "LU": GeoId.LU,
  "LV": GeoId.LV,
  "LY": GeoId.LY,
  "MA": GeoId.MA,
  "MC": GeoId.MC,
  "MD": GeoId.MD,
  "ME": GeoId.ME,
  "MG": GeoId.MG,
  "MK": GeoId.MK,
  "ML": GeoId.ML,
  "MM": GeoId.MM,
  "MN": GeoId.MN,
  "MP": GeoId.MP,
  "MR": GeoId.MR,
  "MS": GeoId.MS,
  "MT": GeoId.MT,
  "MU": GeoId.MU,
  "MV": GeoId.MV,
  "MW": GeoId.MW,
  "MX": GeoId.MX,
  "MY": GeoId.MY,
  "MZ": GeoId.MZ,
  "NA": GeoId.NA,
  "NC": GeoId.NC,
  "NE": GeoId.NE,
  "NG": GeoId.NG,
  "NI": GeoId.NI,
  "NL": GeoId.NL,
  "NO": GeoId.NO,
  "NP": GeoId.NP,
  "NZ": GeoId.NZ,
  "OM": GeoId.OM,
  "PA": GeoId.PA,
  "PE": GeoId.PE,
  "PF": GeoId.PF,
  "PG": GeoId.PG,
  "PH": GeoId.PH,
  "PK": GeoId.PK,
  "PL": GeoId.PL,
  "PR": GeoId.PR,
  "PS": GeoId.PS,
  "PT": GeoId.PT,
  "PY": GeoId.PY,
  "QA": GeoId.QA,
  "RO": GeoId.RO,
  "RS": GeoId.RS,
  "RU": GeoId.RU,
  "RW": GeoId.RW,
  "SA": GeoId.SA,
  "SB": GeoId.SB,
  "SC": GeoId.SC,
  "SD": GeoId.SD,
  "SE": GeoId.SE,
  "SG": GeoId.SG,
  "SI": GeoId.SI,
  "SK": GeoId.SK,
  "SL": GeoId.SL,
  "SM": GeoId.SM,
  "SN": GeoId.SN,
  "SO": GeoId.SO,
  "SR": GeoId.SR,
  "SS": GeoId.SS,
  "ST": GeoId.ST,
  "SV": GeoId.SV,
  "SX": GeoId.SX,
  "SY": GeoId.SY,
  "SZ": GeoId.SZ,
  "TC": GeoId.TC,
  "TD": GeoId.TD,
  "TG": GeoId.TG,
  "TH": GeoId.TH,
  "TJ": GeoId.TJ,
  "TL": GeoId.TL,
  "TN": GeoId.TN,
  "TR": GeoId.TR,
  "TT": GeoId.TT,
  "TW": GeoId.TW,
  "TZ": GeoId.TZ,
  "UA": GeoId.UA,
  "UG": GeoId.UG,
  "UK": GeoId.UK,
  "US": GeoId.US,
  "UY": GeoId.UY,
  "UZ": GeoId.UZ,
  "VA": GeoId.VA,
  "VC": GeoId.VC,
  "VE": GeoId.VE,
  "VG": GeoId.VG,
  "VI": GeoId.VI,
  "VN": GeoId.VN,
  "XK": GeoId.XK,
  "YE": GeoId.YE,
  "ZA": GeoId.ZA,
  "ZM": GeoId.ZM,
  "ZW": GeoId.ZW
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
