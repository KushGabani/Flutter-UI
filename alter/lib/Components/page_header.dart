import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class PageHeader extends StatelessWidget {
  final bool isLightTheme;
  const PageHeader({
    Key key,
    this.isLightTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      color: this.isLightTheme
          ? ColorPallete.kLightBlueColor
          : ColorPallete.kDarkBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/sm_logo.svg",
                      color: this.isLightTheme
                          ? ColorPallete.kBlueColor
                          : ColorPallete.kLightBlueColor,
                      width: 40.0,
                    ),
                    SizedBox(width: 15.0),
                    Text(
                      "Alter",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: this.isLightTheme
                            ? ColorPallete.kBlueColor
                            : ColorPallete.kLightBlueColor,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "Skip",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: this.isLightTheme
                      ? ColorPallete.kLightTextColor
                      : ColorPallete.kSecondaryLightColor,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.isLightTheme ? "Sign Up" : "Sign In",
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    color: this.isLightTheme
                        ? ColorPallete.kBlueColor
                        : ColorPallete.kLightBlueColor,
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    this.isLightTheme
                        ? "Come on in! Join the community to always be in the known."
                        : "Start exactly where you left off\n",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: this.isLightTheme
                          ? ColorPallete.kLightTextColor
                          : ColorPallete.kSecondaryLightColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
