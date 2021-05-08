import 'package:flutter/material.dart';

import '../constants.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const SubmitButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorPallete.kDarkBlueColor,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 20,
                color: ColorPallete.kDarkBlueColor.withOpacity(0.15),
              ),
              BoxShadow(
                offset: Offset(0, -5),
                blurRadius: 20,
                color: ColorPallete.kDarkBlueColor.withOpacity(0.15),
              )
            ]),
        child: Text(
          this.text,
          style: TextStyle(
              color: ColorPallete.kLightBlueColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
