import 'package:flutter/material.dart';

class BaseColor {
  const BaseColor({
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;

  Color myColor(String name) {
    return color;
  }
}

List<BaseColor> baseColorList = [
  BaseColor(name: 'blue', color: Color(0xff5AADF0)),
  BaseColor(name: 'red', color: Color(0xffF05A5A)),
  BaseColor(name: 'green', color: Color(0xff4BDB6A)),
  BaseColor(name: 'black', color: Color(0xff000000)),
  BaseColor(name: 'white', color: Color(0xffFFFFFF)),
];

final baseColors = [
  Color(0xff5AADF0),
  Color(0xffF05A5A),
  Color(0xff4BDB6A),
  Color(0xff000000),
  Color(0xffFFFFFF),
];
