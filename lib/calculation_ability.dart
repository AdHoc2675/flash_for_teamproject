import 'dart:math';

import 'package:flutter/material.dart';

import '../Theme/color.dart';
import '../Theme/font.dart';

class CalculationAbilityPage extends StatefulWidget {
  const CalculationAbilityPage({super.key});

  @override
  State<CalculationAbilityPage> createState() => _CalculationAbilityPageState();
}

class _CalculationAbilityPageState extends State<CalculationAbilityPage> {
  int playCount = 10;
  bool isStarted = false;
  bool isTimeToTouch = false;
  bool isKeepGoing = false;
  bool isRight = false; //정답 판별
  int missTouchCount = 0;
  int frontNum = 0;
  int backNum = 0;
  int mathematicalSymbolValue = 0;
  String mathematicalSymbol = "";
  int score = 0; //최종 점수
  int _time = 0; //걸린 시간
  int answerValue = 0; //정답 값
  int lowerThanAnswer = 0; //정답보다 낮은 값 (틀린값)
  int higherThanAnswer = 0; //정답보다 높은 값 (틀린값)
  int selectedValue = 0; //사용자가 선택한 답의 값을 저장
  int answerButton = 0; //정답 값이 들어있는 버튼의 index

  Widget screenChange() {
    if (playCount <= 0) {
      return CalculationAbilityResult();
    } else if (isStarted == false &&
        isTimeToTouch == false &&
        isKeepGoing == false) {
      return CalculationAbilityNotStarted();
    } else if (isStarted == true &&
        isTimeToTouch == false &&
        isKeepGoing == false) {
      return CalculationAbility();
    } else if (isStarted == true &&
        isTimeToTouch == true &&
        isKeepGoing == false) {
      return CalculationAbility();
    } else if (isStarted == true &&
        isTimeToTouch == true &&
        isKeepGoing == true) {
      return CalculationAbility();
    } else {
      return CalculationAbilityError();
    }
  }

  String mathematicalSymbolReturn(int value) {
    if (value == 0) {
      return "+";
    } else {
      return "-";
    }
    ;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screenChange(),
      ),
    );
  }

  Widget CalculationAbilityNotStarted() {
    return MaterialButton(
      color: ReturnColor('blue'),
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      onPressed: (() {
        print('hello'); //잘 되는지 확인
        setState(() {
          if (isStarted == false) {
            isStarted = true;
          }
          answerButton = Random().nextInt(2);
          frontNum = Random().nextInt(40) + 1;
          backNum = Random().nextInt(40) + 1;
          mathematicalSymbolValue = Random().nextInt(2);
          mathematicalSymbol =
              mathematicalSymbolReturn(mathematicalSymbolValue);
          if (mathematicalSymbolValue == 0) {
            answerValue = frontNum + backNum;
          } else {
            answerValue = frontNum - backNum;
          }
          lowerThanAnswer = answerValue - Random().nextInt(5) + 1;
          higherThanAnswer = answerValue + Random().nextInt(5) + 1;
        });
      }),
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          SizedBox(
            width: 330,
            height: 100,
            child: Text(
              'Calculation\nAbility',
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
                'Touch the answer to the formula on the screen as quickly as you can.',
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

  Widget CalculationAbility() {
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
            height: 100,
            child: Text(
              'Calculation\nAbility',
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
                '${frontNum} ${mathematicalSymbol} ${backNum} = ',
                style: ABeeZee(40, 47.28),
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                minWidth: 80,
                height: 80,
                shape: CircleBorder(
                    side: BorderSide(width: 0, color: ReturnColor('white'))),
                onPressed: () {
                  setState(() {
                    if (answerButton == 0) {
                      selectedValue = answerValue;
                      isRight = true;
                    } else {
                      selectedValue = lowerThanAnswer;
                      isRight = false;
                    }
                  });
                },
                color: ReturnColor('white'),
                child: Text(
                  (answerButton == 0) ? "${answerValue}" : "${lowerThanAnswer}",
                  style: ABeeZee(40, 47.28, color: 'blue'),
                ),
              ),
              MaterialButton(
                minWidth: 80,
                height: 80,
                shape: CircleBorder(
                    side: BorderSide(width: 0, color: ReturnColor('white'))),
                onPressed: () {},
                color: ReturnColor('white'),
                child: Text(
                  (answerButton == 1) ? "${answerValue}" : "${lowerThanAnswer}",
                  style: ABeeZee(40, 47.28, color: 'blue'),
                ),
              ),
              MaterialButton(
                minWidth: 80,
                height: 80,
                shape: CircleBorder(
                    side: BorderSide(width: 0, color: ReturnColor('white'))),
                onPressed: () {},
                color: ReturnColor('white'),
                child: Text(
                  (answerButton == 2)
                      ? "${answerValue}"
                      : "${higherThanAnswer}",
                  style: ABeeZee(40, 47.28, color: 'blue'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 330,
            height: 50,
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

  Widget CalculationAbilityResult() {
    score = _time + (500 * missTouchCount);

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
                  '${_time} ms',
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

  Widget CalculationAbilityError() {
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
              'Calculation\nAbility',
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
