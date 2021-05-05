import 'package:flutter/material.dart';

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
        width: size.width * 0.8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: this.color),
        child: Center(
            child: Text(
                this.text,
                style: TextStyle(color: this.textColor)
            )
        ),
      ),
    );
  }
}

