import 'package:flash_for_teamproject/Pages/chat_screen.dart';
import 'package:flash_for_teamproject/Pages/login.dart';
import 'package:flash_for_teamproject/firebase_options.dart';
import 'package:flash_for_teamproject/reaction_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/loading.dart';
import 'Pages/profilepage.dart';
import 'Pages/weather_screen.dart';
import 'Theme/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_for_teamproject/auth/auth.dart';
import 'flip_over.dart';
import 'calculation_ability.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(builder: ((context, child) => const MyApp()), providers: [
      ChangeNotifierProvider(
        create: (context) => Auth(),
      ),
    ]),
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
        '/login': (BuildContext context) => const LoginSignupScreen(),
        '/profile': (BuildContext context) => const MyProfilePage(),
        '/chat': (BuildContext context) => const ChatScreen(),
      },
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return LoginSignupScreen();
          }
          return LoginSignupScreen();
        }),
      ),
    );
  }
}
