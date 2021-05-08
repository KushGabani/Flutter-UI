import 'package:flutter/material.dart';

import '../constants.dart';
import 'auth_app_bar.dart';

class PageHeader extends StatelessWidget {
  final String header;
  final String subtitle;

  const PageHeader({
    Key key,
    this.header,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      color: ColorPallete.kLightBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AuthAppBar(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.header,
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    color: ColorPallete.kBlueColor,
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    this.subtitle,
                    style: TextStyle(
                        fontSize: 18.0, color: ColorPallete.kLightTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
