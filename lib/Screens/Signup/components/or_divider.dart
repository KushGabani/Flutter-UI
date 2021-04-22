import 'package:flutter/material.dart';
import 'package:registration_app/constants.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18.0),
      width: size.width * 0.65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Divider(
              color: kPrimaryColor,
              height: 1.5,
            ),
          ),
          Text(
            "   OR   ",
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold
            ),
          ),
          Expanded(
            child: Divider(
              color: kPrimaryColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
