import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:accountability_mobile_app/types/streak_goal.dart';

Future<StreakGoal> fetchCodeStreakGoal() async {
  final response = await http.get(Uri.parse(
      'http://127.0.0.1:8000/DayStreakGoals/LootDwMECk7rtEayeKLbV9/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return StreakGoal.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load StreakGoal');
  }
}
