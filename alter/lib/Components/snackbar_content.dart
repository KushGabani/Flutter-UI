import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SnackbarContent extends StatelessWidget {
  final String text;
  final bool error;

  const SnackbarContent({
    Key key,
    @required this.text,
    @required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          this.error
              ? SvgPicture.asset(
                  "assets/icons/cross.svg",
                  width: 25.0,
                )
              : SvgPicture.asset(
                  "assets/icons/success.svg",
                  width: 25.0,
                ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            this.text,
            style: TextStyle(
                color: ColorPallete.kBackgroundColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
