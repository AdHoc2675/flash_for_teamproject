import 'dart:math';

import 'package:flash_for_teamproject/Theme/color.dart';
import 'package:flash_for_teamproject/Theme/font.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class ReactionTime extends StatefulWidget {
  const ReactionTime({
    Key? key,
  }) : super(key: key);

  @override
  _ReactionTimeState createState() => _ReactionTimeState();
}

class _ReactionTimeState extends State<ReactionTime> {
  _ReactionTimeState({Key? key});
  bool isStarted = false; //게임 시작 여부
  bool isTimeToTouch = false; //false시 ready, true시 touch
  bool isKeepGoing = false; //true시 KeepGoing페이지
  Timer _timer = new Timer(const Duration(), () {}); //타이머
  var _time = 0; //타이머 시간 표시
  var _reactionTime = 0;
  var _RandomTime = 0;
  var _totalReactionTime = 0; //반응속도 총합
  var _isPlaying = false; // 타이머 작동/정지 여부
  var playCount = 5; //한 번에 총 5번 플레이한다
  var missTouchCount = 0; //잘못 누른 횟수
  var score = 0; //최종 점수. 점수 공식은 _totalReactionTime + (500 * missTouchCount)

  Widget screenChange() {
    if (playCount <= 0) {
      return ReactionTimeResult();
    } else if (isStarted == false &&
        isTimeToTouch == false &&
        isKeepGoing == false) {
      return ReactionTimeNotStarted();
    } else if (isStarted == true &&
        isTimeToTouch == false &&
        isKeepGoing == false) {
      return ReactionTimeReady();
    } else if (isStarted == true &&
        isTimeToTouch == true &&
        isKeepGoing == false) {
      return ReactionTimeTouch();
    } else if (isStarted == true &&
        isTimeToTouch == true &&
        isKeepGoing == true) {
      return ReactionTimeKeepGoing();
    } else {
      return ReactionTimeError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screenChange(),
      ),
    );
  }

  Widget ReactionTimeNotStarted() {
    return MaterialButton(
      color: ReturnColor('blue'),
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      onPressed: (() {
        print('hello'); //잘 되는지 확인
        setState(() {
          _isPlaying = true;
          if (isStarted == false) {
            isStarted = true;
          }
          _RandomTime = Random().nextInt(3000) + 1000;
        });
      }),
      child: Column(
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
            child: Center(
              child: Text(
                'When the red screen turns green, Touch the screen as quickly as you can.',
                style: ABeeZee(20, 23.64),
                textAlign: TextAlign.center,
              ),
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
      ),
    );
  }

  Widget ReactionTimeReady() {
    Future.delayed(Duration(milliseconds: _RandomTime), () async {
      final player = AudioPlayer();
      await player.setSource(AssetSource('sound/reaction_time_pop.wav'));
      await player.resume();
      setState(() {
        isTimeToTouch = true;
        _time = 0;
      });
    });

    return MaterialButton(
      color: ReturnColor('red'),
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      onPressed: (() {
        missTouchCount = missTouchCount + 1;
      }),
      child: Column(
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
      ),
    );
  }

  Widget ReactionTimeTouch() {
    if (_isPlaying == true) {
      _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
        if (this.mounted) {
          setState(() {
            _time = _time + 1;
          });
        }
      });
    }

    return MaterialButton(
      color: ReturnColor('green'),
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      onPressed: (() {
        setState(() {
          isKeepGoing = true;
          _timer.cancel();
          _reactionTime = _time;
          playCount = playCount - 1;
          _totalReactionTime = _totalReactionTime + _reactionTime;
          _RandomTime = Random().nextInt(2000) + 2000;
        });
        print(_time);
        print(_RandomTime);
        print(_totalReactionTime);
      }),
      child: Column(
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
      ),
    );
  }

  Widget ReactionTimeKeepGoing() {
    return MaterialButton(
      color: ReturnColor('blue'),
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      onPressed: (() {
        setState(() {
          isStarted = true;
          isTimeToTouch = false;
          isKeepGoing = false;
          _isPlaying = false;
          _time = 0;
        });
        print(_time);
      }),
      child: Column(
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
            height: 150,
          ),
          SizedBox(
              width: 330,
              height: 100,
              child: Text(
                '${_reactionTime} MS',
                style: Timetravel(40, 42.6),
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 110,
            child: Text(
              'Touch to\nKeep Going',
              style: ABeeZee(40, 47.28),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 300,
            height: 110,
            child: Text(
              '${playCount} Times Left',
              style: ABeeZee(20, 23.64),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget ReactionTimeResult() {
    score = _totalReactionTime + (500 * missTouchCount);

    return MaterialButton(
      color: ReturnColor('blue'),
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      onPressed: (() {}),
      child: Column(
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
              height: 150,
              child: Center(
                child: Text(
                  'Result',
                  style: ABeeZee(32, 37.82),
                  textAlign: TextAlign.center,
                ),
              )),
          SizedBox(
              width: 330,
              height: 100,
              child: Text(
                '${score}',
                style: Timetravel(40, 42.6),
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 50,
          ),
          SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  '${_totalReactionTime} ms',
                  style: ABeeZee(32, 37.82),
                  textAlign: TextAlign.center,
                ),
              )),
          SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  '${missTouchCount} Times Miss',
                  style: ABeeZee(32, 37.82),
                  textAlign: TextAlign.center,
                ),
              )),
          MaterialButton(
            minWidth: 100,
            height: 100,
            onPressed: (() {
              Navigator.pop(context);
            }),
            child: Icon(
              Icons.home,
              size: 50,
              color: ReturnColor('white'),
            ),
          )
        ],
      ),
    );
  }

  Widget ReactionTimeError() {
    return MaterialButton(
      color: ReturnColor('red'),
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      onPressed: (() {
        setState(() {
          isStarted = false;
          isTimeToTouch = false;
          isKeepGoing = false;
        });
      }),
      child: Column(
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
              child:
                  Icon(Icons.warning, size: 100, color: ReturnColor('white'))),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 110,
            child: Text(
              'ERROR!',
              style: ABeeZee(40, 47.28),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 300,
            height: 110,
            child: Text(
              'Touch The Screen\nTo Restart',
              style: ABeeZee(20, 25),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
