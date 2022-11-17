import 'package:flash_for_teamproject/Theme/color.dart';
import 'package:flutter/material.dart';

TextStyle Timetravel(double size, double height,
    {Color color = const Color(0xffFFFFFF)}) {
  return TextStyle(
    fontSize: size,
    fontFamily: 'Timetravel',
    fontWeight: FontWeight.w500,
    height: height / size,
    color: color,
  );
}

TextStyle ABeeZee(double size, double height,
    {Color color = const Color(0xffFFFFFF)}) {
  return TextStyle(
    fontSize: size,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w400,
    height: height / size,
    color: color,
  );
}

TextStyle Roboto(double size, double height,
    {Color color = const Color(0xffFFFFFF)}) {
  return TextStyle(
    fontSize: size,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    height: height / size,
    color: color,
  );
}
