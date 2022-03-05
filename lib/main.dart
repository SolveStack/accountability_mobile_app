import 'package:flutter/material.dart';
import 'package:accountability_mobile_app/api/streak_goals.dart';
import 'package:accountability_mobile_app/types/streak_goal.dart';

import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accountability Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<StreakGoal> codeStreakGoal;
  final String logo = 'solvestack.svg';

  @override
  void initState() {
    super.initState();
    codeStreakGoal = fetchCodeStreakGoal();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streak Goals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          // leading: SvgPicture.asset(
          //   logo,
          //   color: Colors.black,
          //   width: 56,
          //   height: 56,
          // ),
          // FittedBox(
          //   fit: BoxFit.contain,
          //   child: SvgPicture.asset(logo, color: Colors.teal.shade100, semanticsLabel: 'solvestack logo'),
          // ),
          title: const Text('Streak Goals'),
        ),
        body: Center(
          child: FutureBuilder<StreakGoal>(
            future: codeStreakGoal,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.name);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
