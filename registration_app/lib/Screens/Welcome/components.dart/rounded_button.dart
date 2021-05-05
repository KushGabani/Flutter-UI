import 'package:flutter/material.dart';
import 'package:registration_app/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: this.press,
      child: Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 15.0),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          width: size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: this.color,
          ),
          child: Text(
            this.text,
            style: TextStyle(color: this.textColor, fontSize: 20.0),
          )
      ),
    );
  }
}
