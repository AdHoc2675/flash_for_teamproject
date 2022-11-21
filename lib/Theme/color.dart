import 'package:flutter/material.dart';

class BaseColor {
  const BaseColor({
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;
}

// ignore: non_constant_identifier_names
Color ReturnColor(String name) {
  if (name == 'blue') {
    return const Color(0xff5AADF0);
  } else if (name == 'red') {
    return const Color(0xffF05A5A);
  } else if (name == 'green') {
    return const Color(0xff4BDB6A);
  } else if (name == 'black') {
    return const Color(0xff000000);
  } else if (name == 'white') {
    return const Color(0xffFFFFFF);
  } else {
    return const Color(0xffFFFFFF);
  }
}

List<BaseColor> baseColorList = [
  const BaseColor(name: 'blue', color: Color(0xff5AADF0)),
  const BaseColor(name: 'red', color: Color(0xffF05A5A)),
  const BaseColor(name: 'green', color: Color(0xff4BDB6A)),
  const BaseColor(name: 'black', color: Color(0xff000000)),
  const BaseColor(name: 'white', color: Color(0xffFFFFFF)),
];

final baseColors = [
  const Color(0xff5AADF0),
  const Color(0xffF05A5A),
  const Color(0xff4BDB6A),
  const Color(0xff000000),
  const Color(0xffFFFFFF),
];
