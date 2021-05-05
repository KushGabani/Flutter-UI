import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:registration_app/Screens/Welcome/components/background.dart';
import 'package:registration_app/Screens/Welcome/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to EDU",
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 10.0),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            RoundedButton(),
          ],
        )
    );
  }
}