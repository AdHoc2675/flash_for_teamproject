import 'package:flash_for_teamproject/Pages/login.dart';
import 'package:flash_for_teamproject/firebase_options.dart';
import 'package:flash_for_teamproject/reaction_time.dart';
import 'package:flutter/material.dart';
import 'Pages/loading.dart';
import 'Pages/profilepage.dart';
import 'Pages/weather_screen.dart';
import 'Theme/color.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Theme/color.dart';
import 'flip_over.dart';
import 'reaction_time.dart';
import 'calculation_ability.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(),
  );
}

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
        '/home': (BuildContext context) => const MyHome(),
        '/reaction_time': (BuildContext context) => const ReactionTime(),
        '/flip': (BuildContext context) => const flipOver(),
        '/weather': (BuildContext context) => WeatherScreen(),
        '/loading': (BuildContext context) => Loading(),
        '/calculation_ability': (BuildContext context) =>
            const CalculationAbilityPage(),
        '/login': (BuildContext context) => LoginSignupScreen(),
        '/profile': (BuildContext context) => MyProfilePage(),
      },
      home: LoginSignupScreen(),
    );
  }
}
