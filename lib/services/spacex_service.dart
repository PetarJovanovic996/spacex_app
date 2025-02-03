import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex_app/models/launch_model.dart';

class SpaceXService {
  final String url = "https://api.spacexdata.com/v4";

  Future<List<Launch>> getAllLaunches() async {
    try {
      final response = await http.get(
        Uri.parse("$url/launches"),
      );
      if (response.statusCode != 200) {
        throw Exception(
            "Failed to load launches. Status code: ${response.statusCode}");
      }

      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Launch.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load launches: $e");
    }
  }
}
