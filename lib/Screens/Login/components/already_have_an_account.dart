import 'package:flutter/material.dart';
import 'package:registration_app/constants.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool isLogin;
  final Function pressed;

  AlreadyHaveAnAccount({
    Key key,
    this.isLogin,
    this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.isLogin
              ? "Don't have an account? "
              : "Already have an account? ",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        GestureDetector(
            onTap: this.pressed,
            child: Text(
              this.isLogin ? "Sign Up" : "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ))
      ],
    );
  }
}
