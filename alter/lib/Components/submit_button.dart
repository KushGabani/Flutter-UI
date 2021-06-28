import 'package:flutter/material.dart';

import '../constants.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function onSubmit;
  final bool isSignUp;

  const SubmitButton({
    Key key,
    @required this.text,
    @required this.onSubmit,
    this.isSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onSubmit,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.78,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: this.isSignUp
              ? ColorPallete.kDarkBlueColor
              : ColorPallete.kLightBlueColor,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Text(
          this.text,
          style: TextStyle(
              color: this.isSignUp
                  ? ColorPallete.kLightBlueColor
                  : ColorPallete.kDarkBlueColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
