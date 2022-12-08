import 'package:flash_for_teamproject/Pages/weather_screen.dart';
import 'package:flash_for_teamproject/flip_over.dart';
import 'package:flutter/material.dart';
import 'package:flash_for_teamproject/Pages/loading.dart';
import 'package:flash_for_teamproject/Pages/login.dart';
import 'package:flash_for_teamproject/Pages/profilepage.dart';

import 'Theme/color.dart';
import 'reaction_time.dart';
import 'calculation_ability.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginSignupScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ReturnColor('blue'),
      ),
      initialRoute: '/login',
      routes: {
        '/': (BuildContext context) => const MyHome(),
        '/reaction_time': (BuildContext context) => const ReactionTime(),
        '/flip': (BuildContext context) => const flipOver(),
        '/weather': (BuildContext context) => WeatherScreen(),
        '/loading': (BuildContext context) => Loading(),
        '/calculation_ability': (BuildContext context) =>
            const CalculationAbilityPage(),
        '/login': (BuildContext context) => LoginSignupScreen(),

        '/profile': (BuildContext context) => MyProfilePage(),

      },
    );
  }
}
