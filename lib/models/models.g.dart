// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalData _$GlobalDataFromJson(Map<String, dynamic> json) {
  return GlobalData(
    json['cases'] as int,
    json['deaths'] as int,
    json['recovered'] as int,
    json['updated'] as int,
    json['active'] as int,
  );
}

Map<String, dynamic> _$GlobalDataToJson(GlobalData instance) =>
    <String, dynamic>{
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
      'updated': instance.updated,
      'active': instance.active,
    };

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) {
  return CountryInfo(
    json['_id'] as int,
    json['country'] as String,
    json['iso2'] as String,
    json['iso3'] as String,
    json['lat'] as double,
    json['long'] as double,
    json['flag'] as String,
  );
}

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'country': instance.country,
      'iso2': instance.iso2,
      'iso3': instance.iso3,
      'lat': instance.lat,
      'long': instance.long,
      'flag': instance.flag,
    };

CountryData _$CountryDataFromJson(Map<String, dynamic> json) {
  return CountryData(
    json['country'] as String,
    CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
    json['cases'] as double,
    json['todayCases'] as double,
    json['deaths'] as double,
    json['todayDeaths'] as double,
    json['recovered'] as double,
    json['active'] as double,
    json['critical'] as double,
    json['casesPerOneMillion'] as double,
    json['deathsPerOneMillion'] as double,
    json['updated'] as int,
  );
}

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'country': instance.country,
      'countryInfo': instance.countryInfo,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'updated': instance.updated,
    };

StateData _$StateDataFromJson(Map<String, dynamic> json) {
  return StateData(
    json['state'] as String,
    json['cases'] as double,
    json['todayCases'] as double,
    json['deaths'] as double,
    json['todayDeaths'] as double,
    json['active'] as double,
  );
}

Map<String, dynamic> _$StateDataToJson(StateData instance) => <String, dynamic>{
      'state': instance.state,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'active': instance.active,
    };
