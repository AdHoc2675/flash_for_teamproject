import 'package:flash_for_teamproject/Theme/color.dart';
import 'package:flutter/material.dart';

import 'Pages/homepage.dart';
import 'Pages/leaderboardpage.dart';
import 'Pages/profilepage.dart';
import 'Theme/font.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentPage = 0;
  void _onItemTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  final pages = [
    MyHomepage(), //홈
    MyProfilePage(),
    MyLeaderboardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: MyNavigationBar(context),
    );
  }

  Widget MyNavigationBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyOutlinedButtonInBottomNavBar(
            0,
            'Home',
          ),
          MyOutlinedButtonInBottomNavBar(
            1,
            'Profile',
          ),
          MyOutlinedButtonInBottomNavBar(
            2,
            'Leaderboard',
          ),
        ],
      ),
    );
  }

  Icon getIcons(String iconName, int buttonIndex) {
    if (iconName == 'Home') {
      if (currentPage == buttonIndex) {
        return Icon(Icons.home);
      } else {
        return Icon(
          Icons.home,
          color: Colors.black,
        );
      }
    } else if (iconName == 'Profile') {
      if (currentPage == buttonIndex) {
        return Icon(Icons.account_circle);
      } else {
        return Icon(
          Icons.account_circle,
          color: Colors.black,
        );
      }
    } else if (iconName == 'Leaderboard') {
      if (currentPage == buttonIndex) {
        return Icon(Icons.leaderboard);
      } else {
        return Icon(
          Icons.leaderboard,
          color: Colors.black,
        );
      }
    } else {
      return Icon(Icons.home);
    }
  }

  Widget MyOutlinedButtonInBottomNavBar(
    int buttonIndex,
    String name,
  ) {
    return Container(
      width: 130,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 0, color: Colors.white),
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            setState(() {
              currentPage = buttonIndex;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getIcons(name, buttonIndex),
              currentPage == buttonIndex
                  ? Text(
                      name,
                      style: Roboto(12, 15, color: 'blue'),
                    )
                  : Text(
                      name,
                      style: Roboto(12, 15, color: 'black'),
                    )
            ],
          )),
    );
  }
}
