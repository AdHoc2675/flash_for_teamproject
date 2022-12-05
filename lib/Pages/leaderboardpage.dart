import 'package:flash_for_teamproject/leaderboard_detail.dart';
import 'package:flutter/material.dart';

import '../Theme/color.dart';
import '../Theme/font.dart';

class MyLeaderboardPage extends StatefulWidget {
  const MyLeaderboardPage({super.key});

  @override
  State<MyLeaderboardPage> createState() => _MyLeaderboardPageState();
}

class _MyLeaderboardPageState extends State<MyLeaderboardPage> {
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text('Flash',
                style: Timetravel(
                  50,
                  53.25,
                )),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            // 각 게임의 리더보드를 볼 수 있는 버튼을 구성합니다
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Stack(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(
                                width: 0, color: ReturnColor('white')),
                            backgroundColor: ReturnColor('white'),
                            fixedSize: Size(330, 80)),
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyLeaderboardDetailPage()));
                        }),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Reaction Time',
                                style: ABeeZee(20, 23.64, color: 'black'),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            // 각 게임의 리더보드를 볼 수 있는 버튼을 구성합니다
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Stack(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(
                                width: 0, color: ReturnColor('white')),
                            backgroundColor: ReturnColor('white'),
                            fixedSize: Size(330, 80)),
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyLeaderboardDetailPage()));
                        }),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Calculation Ability',
                                style: ABeeZee(20, 23.64, color: 'black'),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            // 각 게임의 리더보드를 볼 수 있는 버튼을 구성합니다
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Stack(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(
                                width: 0, color: ReturnColor('white')),
                            backgroundColor: ReturnColor('white'),
                            fixedSize: Size(330, 80)),
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyLeaderboardDetailPage()));
                        }),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Paper-FlipOver',
                                style: ABeeZee(20, 23.64, color: 'black'),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
