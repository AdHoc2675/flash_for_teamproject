// ignore_for_file: non_constant_identifier_names

import 'package:flash_for_teamproject/Theme/color.dart';
import 'package:flutter/material.dart';

TextStyle Timetravel(double size, double height, {String color = 'white'}) {
  Color thisColor = ReturnColor(color);

  return TextStyle(
    fontSize: size,
    fontFamily: 'Timetravle',
    fontWeight: FontWeight.w500,
    height: height / size,
    color: thisColor,
  );
}

TextStyle ABeeZee(double size, double height, {String color = 'white'}) {
  Color thisColor = ReturnColor(color);

  return TextStyle(
    fontSize: size,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w400,
    height: height / size,
    color: thisColor,
  );
}

TextStyle Roboto(double size, double height, {String color = 'white'}) {
  Color thisColor = ReturnColor(color);

  return TextStyle(
    fontSize: size,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    height: height / size,
    color: thisColor,
  );
}
