import 'Theme/color.dart';
import 'Theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class flipOver extends StatefulWidget {
  const flipOver({super.key});

  @override
  State<flipOver> createState() => _flipOverState();
}

class _flipOverState extends State<flipOver> {
  _flipOverState({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              'Paper-FlipOver',
              style: ABeeZee(40, 47.28),
            ),
          ),
          const SizedBox(
            height: 98,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: Text(
              'Touch the Paper-FlipOver',
              style: ABeeZee(20, 23.64),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: Text(
              'as quickly as you can',
              style: ABeeZee(20, 23.64),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: Text(
              'You can choose difficulty.',
              style: ABeeZee(20, 23.64),
            ),
          ),
          const SizedBox(
            height: 181,
          ),
        ],
      ),
    );
  }
}
