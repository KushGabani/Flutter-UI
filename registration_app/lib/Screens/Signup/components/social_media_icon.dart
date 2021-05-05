import 'package:flutter/material.dart';
import 'package:registration_app/constants.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcon extends StatelessWidget {
  final smIcon;

  SocialMediaIcon({
    Key key,
    this.smIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: kPrimaryColor,
            ),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            this.smIcon,
            height: 25,
            width: 25,
            color: kPrimaryColor,
          )),
    );
  }
}
