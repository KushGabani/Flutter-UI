import 'package:flutter/material.dart';
import './nav_icon.dart';

class BottomNavBar extends StatelessWidget {
  final int pageIndex;
  final void Function(int) changePage;

  const BottomNavBar({
    Key key,
    this.pageIndex,
    this.changePage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NavIcon(
            iconPath: "assets/icons/calendar.svg",
            text: "Today",
            press: () => changePage(0),
            isActive: pageIndex == 0,
          ),
          NavIcon(
            iconPath: "assets/icons/gym.svg",
            text: "All Exercises",
            isActive: pageIndex == 1,
            press: () => changePage(1),
          ),
          NavIcon(
            iconPath: "assets/icons/Settings.svg",
            text: "Settings",
            isActive: pageIndex == 2,
            press: () => changePage(2),
          )
        ],
      ),
    );
  }
}
