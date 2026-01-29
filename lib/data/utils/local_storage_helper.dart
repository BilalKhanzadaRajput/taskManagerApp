import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task_model.dart';

class LocalStorageHelper {
  static const String _tasksKey = 'cached_tasks';
  static const String _lastFetchTimeKey = 'last_fetch_time';

  // Save tasks to local storage
  static Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((task) => task.toJson()).toList();
    await prefs.setString(_tasksKey, jsonEncode(tasksJson));
    await prefs.setString(_lastFetchTimeKey, DateTime.now().toIso8601String());
  }

  // Get cached tasks from local storage
  static Future<List<TaskModel>?> getCachedTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJsonString = prefs.getString(_tasksKey);
      if (tasksJsonString == null) return null;

      final List<dynamic> tasksJson = jsonDecode(tasksJsonString);
      return tasksJson.map((json) => TaskModel.fromJson(json)).toList();
    } catch (e) {
      return null;
    }
  }

  // Get last fetch time
  static Future<DateTime?> getLastFetchTime() async {
    final prefs = await SharedPreferences.getInstance();
    final timeString = prefs.getString(_lastFetchTimeKey);
    if (timeString == null) return null;
    return DateTime.parse(timeString);
  }

  // Clear cached tasks
  static Future<void> clearCachedTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tasksKey);
    await prefs.remove(_lastFetchTimeKey);
  }
}
