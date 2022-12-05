import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Theme/color.dart';
import '../Theme/font.dart';

class MyLeaderboardDetailPage extends StatefulWidget {
  const MyLeaderboardDetailPage({super.key});

  @override
  State<MyLeaderboardDetailPage> createState() =>
      _MyLeaderboardDetailPageState();
}

class _MyLeaderboardDetailPageState extends State<MyLeaderboardDetailPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ReturnColor('blue'),
        body: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Lottie.network(
                    'https://assets2.lottiefiles.com/private_files/lf30_rw51hqmt.json'),
              ),
              Padding(
                // 전체 순위
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: 330,
                  height: 400,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: ReturnColor('white'),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListView(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 100,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                leading: Text(
                                  '#${index}',
                                  style: ABeeZee(16, 18.91, color: 'black'),
                                ),
                                title: Text(
                                  'userid',
                                  style: ABeeZee(16, 18.91, color: 'black'),
                                ),
                                trailing: Text(
                                  '123456',
                                  style: ABeeZee(16, 18.91, color: 'black'),
                                ),
                              );
                            }))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Divider(
                  thickness: 5,
                  color: ReturnColor('black'),
                ),
              ),
              Padding(
                // 내 등수 표시
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: 330,
                  height: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: ReturnColor('white'),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Text(
                          '#rank',
                          style: ABeeZee(16, 18.91, color: 'black'),
                        ),
                        title: Text(
                          'userid',
                          style: ABeeZee(16, 18.91, color: 'black'),
                        ),
                        trailing: Text(
                          '123456',
                          style: ABeeZee(16, 18.91, color: 'black'),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Expanded(
                      //         child: Container(
                      //       child: Text(
                      //         '#rank',
                      //         style: ABeeZee(16, 18.91, color: 'black'),
                      //       ),
                      //     )),
                      //     Expanded(
                      //         flex: 2,
                      //         child: Container(
                      //           child: Text(
                      //             'userid',
                      //             style: ABeeZee(16, 18.91, color: 'black'),
                      //           ),
                      //         )),
                      //     Expanded(
                      //         child: Container(
                      //       child: Text(
                      //         '123456',
                      //         style: ABeeZee(16, 18.91, color: 'black'),
                      //       ),
                      //     )),
                      //   ],
                      // ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
