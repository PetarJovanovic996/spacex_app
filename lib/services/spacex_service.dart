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

  Future<Launch> getSingleLaunch(String id) async {
    final response = await http.get(
      Uri.parse("$url/launches/$id"),
    );
    if (response.statusCode != 200) {
      throw Exception(
          "Failed to load launch. Status code: ${response.statusCode}");
    }
    final data = json.decode(response.body);
    return Launch.fromJson(data);
  }

  Future<Launch> getLatestLaunch() async {
    final response = await http.get(
      Uri.parse("$url/launches/latest"),
    );
    if (response.statusCode != 200) {
      throw Exception(
          "Failed to load launch. Status code: ${response.statusCode}");
    }
    final data = json.decode(response.body);
    return Launch.fromJson(data);
  }

  Future<List<Launch>> getPastLaunches() async {
    try {
      final response = await http.get(
        Uri.parse("$url/launches/past"),
      );
      if (response.statusCode != 200) {
        throw Exception(
            "Failed to load past launches. Status code: ${response.statusCode}");
      }

      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Launch.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load past launches: $e");
    }
  }
}
