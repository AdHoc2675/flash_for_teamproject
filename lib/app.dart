import 'package:flutter/material.dart';
import 'main.dart';
import 'reaction_time.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const MyApp(),
        '/reaction_time': (BuildContext context) => const ReactionTime(),
      },
    );
  }
}
