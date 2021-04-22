import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/arrow-left.svg",
          ),
          SvgPicture.asset(
            "assets/icons/menu.svg",
          ),
        ],
      ),
    );
  }
}
