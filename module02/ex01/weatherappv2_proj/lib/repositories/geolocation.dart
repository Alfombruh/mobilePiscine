import 'package:weatherappv2_proj/model/geolocation.dart';
import 'package:weatherappv2_proj/provider/geolocation.dart';

class GeolocationRepository {
  final GeolocationProvider _provider = GeolocationProvider();

  Future<GeoLocation> getGeoLocation(double latitude, double longitude) async {
    try {
      final response = await _provider.getGeoLocation(latitude, longitude);
      return GeoLocation.fromJson(response);
    } catch (error) {
      throw Exception("Error fetching geolocation: $error");
    }
  }
}
