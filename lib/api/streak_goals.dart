import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:accountability_mobile_app/types/streak_goal.dart';

Future<StreakGoal> fetchCodeStreakGoal() async {
  const streakGoalId = '5ujpQb6LqB8FcBBs9Gbkuj';
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/day-streak-goals/${streakGoalId}/'));

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
