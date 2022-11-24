import 'package:flutter/material.dart';
import 'Theme/color.dart';
import 'main.dart';
import 'reaction_time.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ReturnColor('blue'),
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const MyHome(),
        '/reaction_time': (BuildContext context) => const ReactionTime(),
      },
    );
  }
}
