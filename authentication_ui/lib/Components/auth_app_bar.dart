import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/sm_logo.svg",
                color: ColorPallete.kBlueColor,
                width: 50.0,
              ),
              SizedBox(width: 15.0),
              Text(
                "Clove",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: ColorPallete.kBlueColor,
                ),
              )
            ],
          ),
        ),
        Text(
          "Skip",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: ColorPallete.kLightTextColor,
          ),
        ),
      ],
    );
  }
}
