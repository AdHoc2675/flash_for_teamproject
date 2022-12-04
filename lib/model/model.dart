import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Model {
  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset('svg/climacon-cloud_lightning.svg',
          color: Colors.black87);
    } else if (condition < 600) {
      return SvgPicture.asset('svg/climacon-cloud_snow_alt.svg',
          color: Colors.black87);
    } else if (condition == 800) {
      return SvgPicture.asset('svg/climacon-sun.svg', color: Colors.black87);
    } else if (condition <= 804) {
      return SvgPicture.asset('svg/climacon-cloud_sun.svg',
          color: Colors.black87);
    }
  }

  Widget? getAirIcon(int? grade) {
    if (grade == 1) {
      return Image.asset('assets/images/good.png', width: 37.0, height: 35.0);
    } else if (grade == 2) {
      return Image.asset('assets/images/fair.png', width: 37.0, height: 35.0);
    } else if (grade == 3) {
      return Image.asset('assets/images/moderate.png',
          width: 37.0, height: 35.0);
    } else if (grade == 4) {
      return Image.asset('assets/images/poor.png', width: 37.0, height: 35.0);
    } else if (grade == 5) {
      return Image.asset('assets/images/bad.png', width: 37.0, height: 35.0);
    }
  }

  Widget? airIndex(int? index) {
    if (index == 1) {
      return const Text('"매우좋음"',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
    } else if (index == 1) {
      return const Text('"좋음"',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
    } else if (index == 1) {
      return const Text('"보통"',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
    } else if (index == 1) {
      return const Text('"나쁨"',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
    } else if (index == 1) {
      return const Text('"매우나쁨"',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
    }
  }
}
