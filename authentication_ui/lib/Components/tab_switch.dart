import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TabSwitch extends StatelessWidget {
  final int index;
  final void Function(int) onPressed;

  const TabSwitch({
    Key key,
    this.index,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: const <int, Widget>{
        0: Text(
          "Register",
          style: TextStyle(color: ColorPallete.kBlueColor),
        ),
        1: Text(
          "Log In",
          style: TextStyle(color: ColorPallete.kBlueColor),
        ),
      },
      groupValue: this.index,
      onValueChanged: (i) => onPressed(i),
    );
  }
}
