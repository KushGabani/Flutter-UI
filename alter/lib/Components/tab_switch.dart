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
        0: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Sign Up",
            style: TextStyle(color: ColorPallete.kBlueColor),
          ),
        ),
        1: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Sign In",
            style: TextStyle(color: ColorPallete.kBlueColor),
          ),
        ),
      },
      groupValue: this.index,
      onValueChanged: (i) => this.onPressed(i),
    );
  }
}
