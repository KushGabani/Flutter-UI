import 'package:flutter/material.dart';
import 'package:registration_app/constants.dart';

class TextInputFieldContainer extends StatelessWidget {
  final Widget child;

  TextInputFieldContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: this.child,
      )
    );
  }
}
