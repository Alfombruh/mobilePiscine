class GeoLocation {
  final String latitude;
  final String longitude;
  final String country; //country in the response call, may be county
  final String city; //name is the response

  GeoLocation(
      {required this.latitude,
      required this.longitude,
      required this.country,
      required this.city});
  
    factory GeoLocation.fromJson(Map<String, dynamic> json) {
      return GeoLocation(
        latitude: json['data:latitude'] as String,
        longitude: json['data:longitude'] as String,
        city: json['data:city'] as String,
        country: json['data:country'] as String,
      );
    }
    
    Map<String, dynamic> toJson() {
      return {
        'latitude': latitude,
        'longitude': longitude,
        'city': city,
        'country': country,
      };
    }
}
