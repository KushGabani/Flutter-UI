import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SignInWithButton extends StatelessWidget {
  final String provider;
  final Function onPressed;

  const SignInWithButton({
    Key key,
    this.provider,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorPallete.kLightBlueColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset("assets/icons/" + this.provider + ".svg"),
      ),
    );
  }
}
