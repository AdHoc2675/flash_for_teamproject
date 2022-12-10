import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import '../Theme/color.dart';
import '../Theme/font.dart';

class MyLeaderboardDetailPage extends StatefulWidget {
  const MyLeaderboardDetailPage({super.key});

  @override
  State<MyLeaderboardDetailPage> createState() =>
      _MyLeaderboardDetailPageState();
}

class LeaderBoardData {
  LeaderBoardData({required this.name, required this.id, required this.score});
  final String name;
  final String id;
  final int score;
}

class _MyLeaderboardDetailPageState extends State<MyLeaderboardDetailPage> {
  List<LeaderBoardData> _leaderBoardData = [];
  StreamSubscription<QuerySnapshot>? _leaderBoardSubscription;

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((user) {
      _leaderBoardSubscription = FirebaseFirestore.instance
          .collection('ReactionTime')
          .orderBy('score')
          .snapshots()
          .listen(
        (snapshot) {
          _leaderBoardData = [];
          for (final document in snapshot.docs) {
            print(document.id);
            _leaderBoardData.add(LeaderBoardData(
              score: document.data()['score'] as int,
              name: document.data()['name'] as String,
              id: document.id as String,
            ));
          }
        },
      );
    });
  }

  _MyLeaderboardDetailPageState() {
    init();
  }

  var db = FirebaseFirestore.instance;

  @override
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
                  height: 550,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: ReturnColor('white'),
                          borderRadius: BorderRadius.circular(15)),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('ReactionTime')
                                .orderBy('score')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data?.docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        QueryDocumentSnapshot x =
                                            snapshot.data!.docs[index];

                                        return ListTile(
                                          leading: Text(
                                            '#${index + 1}',
                                            style: ABeeZee(16, 18.91,
                                                color: 'black'),
                                          ),
                                          title: Text(
                                            x['name'],
                                            style: ABeeZee(16, 18.91,
                                                color: 'black'),
                                          ),
                                          trailing: Text(
                                            x['score'].toString(),
                                            style: ABeeZee(16, 18.91,
                                                color: 'black'),
                                          ),
                                        );
                                      });
                                } else {
                                  return SpinKitDoubleBounce(
                                    duration: Duration(seconds: 3),
                                    color: Colors.white,
                                    size: 80.0,
                                  );
                                }
                              } else {
                                return SpinKitDoubleBounce(
                                  duration: Duration(seconds: 3),
                                  color: Colors.white,
                                  size: 80.0,
                                );
                              }
                            },
                          )
                        ],
                      )),
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              //   child: Divider(
              //     thickness: 5,
              //     color: ReturnColor('black'),
              //   ),
              // ),
              // Padding(
              //   // 내 등수 표시
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: Container(
              //     width: 330,
              //     height: 80,
              //     child: DecoratedBox(
              //       decoration: BoxDecoration(
              //           color: ReturnColor('white'),
              //           borderRadius: BorderRadius.circular(15)),
              //       child: Padding(
              //         padding: EdgeInsets.all(10),
              //         child: ListTile(
              //           leading: Text(
              //             '#rank',
              //             style: ABeeZee(16, 18.91, color: 'black'),
              //           ),
              //           title: Text(
              //             'userid',
              //             style: ABeeZee(16, 18.91, color: 'black'),
              //           ),
              //           trailing: Text(
              //             '123456',
              //             style: ABeeZee(16, 18.91, color: 'black'),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
