import 'package:http/http.dart' as http;
import 'dart:convert';

class GeolocationProvider {
  final String api =
      const String.fromEnvironment("RGEOLOCATION_API_PATH", defaultValue: "");
  Future<String> getGeoLocation() async {
    try {
      final res = await http.get(Uri.parse(api));
      if (res.statusCode == 200) {
        return res.body;
      }
      throw Exception("Couldn't fetch geolocation");
    } catch (error) {
      return "Sexo";
    }
  }
}