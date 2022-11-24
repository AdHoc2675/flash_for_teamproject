import 'package:flash_for_teamproject/Theme/color.dart';
import 'package:flash_for_teamproject/Theme/font.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          (isStarted == false) ? ReturnColor('blue') : ReturnColor('red'),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: (() {
                  setState(() {
                    isStarted = true;
                  });
                }),
                child: Text(
                  'touch to start',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
