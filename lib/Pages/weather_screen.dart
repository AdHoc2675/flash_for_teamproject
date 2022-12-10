import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import '../Theme/color.dart';
import 'package:flash_for_teamproject/model/model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirPollution});
  final dynamic parseWeatherData;
  final dynamic parseAirPollution;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;
  Model model = Model();
  String? cityName;
  int? temp;
  Widget? icon;
  Widget? pollution;
  Widget? quality;
  String? des;

  double? air;
  double? air2;

  var date = DateTime.now();

  void initState() {
    super.initState();

    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    try {
      double temp2 = weatherData['main']['temp'].toDouble();
      temp = temp2.toInt();
      cityName = weatherData['name'];

      var condition = weatherData['weather'][0]['id'];
      var grade = airData['list'][0]['main']['aqi'];
      var index = airData['list'][0]['main']['aqi'];
      des = weatherData['weather'][0]['description'];
      icon = model.getWeatherIcon(condition);
      pollution = model.getAirIcon(grade);
      quality = model.airIndex(index);
      air = airData['list'][0]['components']['pm2_5'];
      air2 = airData['list'][0]['components']['pm10'];
      print(temp);
      print(cityName);
    } catch (e) {
      Text('there is no data');
    }
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _authentication.signOut();
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Logout 하였습니다.')));
              Navigator.pushNamed(context, '/login');
            },
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        color: ReturnColor('blue'),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 150.0,
                            ),
                            Text('$cityName',
                                style: GoogleFonts.lato(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (Duration(minutes: 1)),
                                  builder: (context) {
                                    print(getSystemTime());
                                    return Text(getSystemTime(),
                                        style: GoogleFonts.lato(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ));
                                  },
                                ),
                                Text(DateFormat(' - EEEE, ').format(date),
                                    style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    )),
                                Text(DateFormat('d MMM, yyy').format(date),
                                    style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp\u2103',
                              style: GoogleFonts.lato(
                                fontSize: 85.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                icon!,
                                SizedBox(width: 10.0),
                                Text('$des',
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 40.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white30)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('AQI(대기질지수)',
                                  style: GoogleFonts.lato(
                                      fontSize: 14.0, color: Colors.white)),
                              const SizedBox(
                                height: 10.0,
                              ),
                              pollution!,
                              const SizedBox(height: 10.0),
                              quality!,
                            ],
                          ),
                          Column(
                            children: [
                              Text('미세먼지',
                                  style: GoogleFonts.lato(
                                      fontSize: 14.0, color: Colors.white)),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text('$air2',
                                  style: GoogleFonts.lato(
                                      fontSize: 24.0, color: Colors.white)),
                              const SizedBox(height: 10.0),
                              Text('㎍/m3',
                                  style: GoogleFonts.lato(
                                      fontSize: 14.0, color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('초미세먼지',
                                  style: GoogleFonts.lato(
                                      fontSize: 14.0, color: Colors.white)),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text('$air',
                                  style: GoogleFonts.lato(
                                      fontSize: 24.0, color: Colors.white)),
                              const SizedBox(height: 10.0),
                              Text('㎍/m3',
                                  style: GoogleFonts.lato(
                                      fontSize: 14.0, color: Colors.white)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
