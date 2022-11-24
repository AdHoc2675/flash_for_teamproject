import 'package:flash_for_teamproject/Theme/color.dart';
import 'package:flash_for_teamproject/Theme/font.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ReactionTime extends StatefulWidget {
  const ReactionTime({
    Key? key,
  }) : super(key: key);

  @override
  _ReactionTimeState createState() => _ReactionTimeState();
}

class _ReactionTimeState extends State<ReactionTime> {
  _ReactionTimeState({Key? key});
  bool isStarted = false;
  bool isTimeToTouch = false;
  Timer _timer = new Timer(const Duration(), () {}); //타이머
  var _time = 0; //타이머 시간 표시
  var _isPlaying = false; // 타이머 작동/정지 여부

  void dispose() {
    _timer?.cancel(); //_timer 가 null이 아니면 cancle()
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isStarted == false)
          ? ReturnColor('blue')
          : (isTimeToTouch == false)
              ? ReturnColor('red')
              : ReturnColor('green'),
      body: Center(
          child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        onPressed: (() {
          print('hello');
          setState(() {
            if (isStarted == false) {
              isStarted = true;
            }
          });
        }),
        child: (isStarted == false)
            ? ReactionTimeNotStarted()
            : (isTimeToTouch == false)
                ? ReactionTimeReady()
                : ReactionTimeTouch(),
      )),
    );
  }

  Column ReactionTimeNotStarted() {
    return Column(
      children: [
        SizedBox(
          height: 70,
        ),
        SizedBox(
          width: 330,
          height: 50,
          child: Text(
            'Reaction Time',
            style: ABeeZee(40, 47.28),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 100,
        ),
        SizedBox(
          width: 300,
          height: 110,
          child: Text(
            'When the red screen turns green, Touch the screen as quickly as you can.',
            style: ABeeZee(20, 23.64),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          height: 110,
          child: Text(
            'Touch to Start',
            style: ABeeZee(40, 47.28),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Column ReactionTimeReady() {
    return Column(
      children: [
        SizedBox(
          height: 70,
        ),
        SizedBox(
          width: 330,
          height: 50,
          child: Text(
            'Reaction Time',
            style: ABeeZee(40, 47.28),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 100,
        ),
        SizedBox(
            width: 100,
            height: 100,
            child: Icon(
              Icons.hourglass_top,
              size: 100,
              color: ReturnColor('white'),
            )),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          height: 110,
          child: Text(
            'Ready...',
            style: ABeeZee(40, 47.28),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Column ReactionTimeTouch() {
    return Column(
      children: [
        SizedBox(
          height: 70,
        ),
        SizedBox(
          width: 330,
          height: 50,
          child: Text(
            'Reaction Time',
            style: ABeeZee(40, 47.28),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 100,
        ),
        SizedBox(
            width: 100,
            height: 100,
            child: Icon(Icons.hourglass_bottom,
                size: 100, color: ReturnColor('white'))),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          height: 110,
          child: Text(
            'Touch!',
            style: ABeeZee(40, 47.28),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
