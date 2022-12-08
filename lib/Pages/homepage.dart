import 'package:flutter/material.dart';

import '../Theme/color.dart';
import '../Theme/font.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
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
              onPressed: () {},
              iconSize: 30.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text('Flash',
                  style: Timetravel(
                    50,
                    53.25,
                  )),
            ),
            const SizedBox(
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
                const SizedBox(
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
            const SizedBox(
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
