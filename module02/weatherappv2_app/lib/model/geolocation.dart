// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/*
      "latitude": 43.37891,
      "longitude": -2.98313,
      "elevation": 51.0,
      "country": "Spain",
      "admin1": "Basque Country",
      "admin2": "Biscay",
      "admin3": "Sopela"
*/

class GeoLocation {
  final double latitude;
  final double longitude;
  final double? elevation;
  final String? country; //country in the response call, may be county (Spain)
  final String? state; //state in which we are (Biscay)
  final String? city; //name is the response (Soplela)

  GeoLocation(
    this.latitude,
    this.longitude,
    this.elevation,
    this.country,
    this.state,
    this.city,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'elevation': elevation,
      'country': country,
      'state': state,
      'city': city,
    };
  }

  factory GeoLocation.fromMap(Map<String, dynamic> map) {
    return GeoLocation(
      map['latitude'] as double,
      map['longitude'] as double,
      map['elevation'] != null ? map['elevation'] as double : null,
      map['country'] != null ? map['country'] as String : null,
      map['state'] != null ? map['state'] as String : null,
      map['city'] != null ? map['city'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoLocation.fromJson(String source) => GeoLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
