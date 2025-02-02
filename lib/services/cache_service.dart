import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const String _launchesCacheKey = 'launches_cache_key';

  Future<List<dynamic>> getCachedLaunches() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? cachedData = prefs.getString(_launchesCacheKey);

      if (cachedData != null) {
        return json.decode(cachedData);
      }
    } catch (e) {
      throw Exception("Error reading cache: $e");
    }
    return [];
  }

  Future<void> cacheLaunches(List<dynamic> launches) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String jsonData = json.encode(launches);
      await prefs.setString(_launchesCacheKey, jsonData);
    } catch (e) {
      throw Exception("Error saving cache: $e");
    }
  }

  Future<void> clearCache() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(_launchesCacheKey);
    } catch (e) {
      throw Exception("Error clearing cache: $e");
    }
  }
}
