import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable(nullable: false)
class GlobalData {
  final int cases;
  final int deaths;
  final int recovered;
  final int updated;
  final int active;

  GlobalData(this.cases, this.deaths, this.recovered, this.updated, this.active);

  factory GlobalData.fromJson(Map<String, dynamic> json) => _$GlobalDataFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalDataToJson(this);
}

@JsonSerializable(nullable: false)
class CountryInfo {

  @JsonKey(name: '_id')
  final int id;

  final String country;
  final String iso2;
  final String iso3;
  final double lat;
  final double long;
  final String flag;

  CountryInfo(this.id, this.country, this.iso2, this.iso3, this.lat, this.long, this.flag);

  factory CountryInfo.fromJson(Map<String, dynamic> json) => _$CountryInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CountryInfoToJson(this);
}

@JsonSerializable(nullable: false)
class CountryData {
  final String country;
  final CountryInfo countryInfo;
  final double cases;
  final double todayCases;
  final double deaths;
  final double todayDeaths;
  final double recovered;
  final double active;
  final double critical;
  final double casesPerOneMillion;
  final double deathsPerOneMillion;
  final int updated;

  CountryData(this.country, this.countryInfo, this.cases, this.todayCases, this.deaths, this.todayDeaths, this.recovered, this.active, this.critical, this.casesPerOneMillion, this.deathsPerOneMillion, this.updated);

  factory CountryData.fromJson(Map<String, dynamic> json) => _$CountryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CountryDataToJson(this);
}

@JsonSerializable(nullable: false)
class StateData {
  final String state;
  final double cases;
  final double todayCases;
  final double deaths;
  final double todayDeaths;
  final double active;

  StateData(this.state, this.cases, this.todayCases, this.deaths, this.todayDeaths, this.active);

  factory StateData.fromJson(Map<String, dynamic> json) => _$StateDataFromJson(json);
  Map<String, dynamic> toJson() => _$StateDataToJson(this);
}