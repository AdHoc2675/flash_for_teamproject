import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Theme/color.dart';
import '../Theme/font.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _authentication.signOut();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Logout 하였습니다.')));
                Navigator.pushNamed(context, '/login');
              },
              iconSize: 30.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 60,
                child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                  FlickerAnimatedText("Flash",
                      textStyle: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Timetravle',
                          fontWeight: FontWeight.w500,
                          height: 53.25 / 50,
                          color: ReturnColor('white'),
                          shadows: [
                            Shadow(
                              blurRadius: 7.0,
                              color: Colors.white,
                              offset: Offset(2, 2),
                            ),
                          ]))
                ]),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              // 홈에 있는 각 게임의 버튼을 구성합니다.
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: Stack(
                    children: [
                      ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              side: BorderSide(
                                  width: 0, color: ReturnColor('white')),
                              backgroundColor: ReturnColor('white'),
                              fixedSize: Size(330, 150)),
                          onPressed: (() {
                            Navigator.pushNamed(context, '/reaction_time');
                          }),
                          child: Text(
                            '275 MS',
                            style: Timetravel(32, 34.08, color: 'blue'),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    'Reaction Time',
                    style: ABeeZee(20, 23.64),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              // 홈에 있는 각 게임의 버튼을 구성합니다.
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: Stack(
                    children: [
                      ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              side: BorderSide(
                                  width: 0, color: ReturnColor('white')),
                              backgroundColor: ReturnColor('white'),
                              fixedSize: Size(330, 150)),
                          onPressed: (() {
                            Navigator.pushNamed(
                                context, '/calculation_ability');
                          }),
                          child: Text(
                            '3 + 5 = 8',
                            style: ABeeZee(40, 47.28, color: 'blue'),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    'Calculation Ability',
                    style: ABeeZee(20, 23.64),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                    child: Stack(children: [
                      ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              side: BorderSide(
                                  width: 0, color: ReturnColor('white')),
                              backgroundColor: ReturnColor('white'),
                              fixedSize: Size(330, 150)),
                          onPressed: (() {
                            Navigator.pushNamed(context, '/flip');
                          }),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ReturnColor('blue')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ReturnColor('blue')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ReturnColor('red')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ReturnColor('blue')),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ReturnColor('blue')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ReturnColor('red')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ReturnColor('red')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: ReturnColor('blue')),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ])),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    'Paper-FlipOver',
                    style: ABeeZee(20, 23.64),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
