import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../Theme/color.dart';
import '../Theme/font.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          iconSize: 30.0,
        ),
      ),
      body: Center(
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
              height: 40,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://i.imgur.com/BoN9kdC.png"))),
            ),
            SizedBox(
              height: 30,
            ),
            Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Stack(
                  children: [
                    ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          side:
                              BorderSide(width: 0, color: ReturnColor('white')),
                          backgroundColor: ReturnColor('white'),
                          fixedSize: Size(330, 80)),
                      onPressed: (() {}),
                      child: Text(
                        'User1234',
                        style: ABeeZee(30, 37.82, color: 'black'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Stack(
    return Center(
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
            height: 40,
          ),
          Container(
            width: 150,
            height: 150,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://i.imgur.com/BoN9kdC.png"))),
          ),
          SizedBox(
            height: 30,
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Stack(
                children: [
                  ElevatedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        side: BorderSide(width: 0, color: ReturnColor('white')),
                        backgroundColor: ReturnColor('white'),
                        fixedSize: Size(330, 80)),
                    onPressed: (() {}),
                    child: Text(
                      'Chat',
                      style: ABeeZee(30, 37.82, color: 'black'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Stack(
                children: [
                  ElevatedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        side: BorderSide(width: 0, color: ReturnColor('white')),
                        backgroundColor: ReturnColor('white'),
                        fixedSize: Size(330, 80)),
                    onPressed: (() {
                      Navigator.pushNamed(context, '/loading');
                    }),
                    child: Text(
                      'Weather',
                      style: ABeeZee(30, 37.82, color: 'black'),
                    ),
                  ),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}
