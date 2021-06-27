import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function onSubmit;

  const SubmitButton({
    Key key,
    @required this.text,
    @required this.onSubmit,
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
            color: ColorPallete.kDarkBlueColor,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 20,
                color: ColorPallete.kDarkBlueColor.withOpacity(0.12),
              ),
              BoxShadow(
                offset: Offset(0, -5),
                blurRadius: 20,
                color: ColorPallete.kDarkBlueColor.withOpacity(0.12),
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
