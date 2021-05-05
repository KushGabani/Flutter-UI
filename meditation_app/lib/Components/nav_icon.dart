import 'package:demo_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavIcon extends StatelessWidget {
  final String iconPath, text;
  final Function press;
  final bool isActive;

  const NavIcon({
    Key key,
    @required this.iconPath,
    @required this.text,
    this.isActive = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              this.iconPath,
              color: isActive ? kActiveIconColor : kTextColor,
            ),
            Text(
              this.text,
              style: TextStyle(
                color: isActive ? kActiveIconColor : kTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
