import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './../Components/tab_switch.dart';
import './../Components/authentication_form.dart';

import 'package:flutter_svg/flutter_svg.dart';
import './../Components/page_header.dart';
import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int tabIndex = 0;

  void changeTab(int i) {
    setState(() {
      this.tabIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: ColorPallete.kBackgroundColor,
          body: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  PageHeader(
                    isLightTheme: this.tabIndex == 0
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
                    child: TabSwitch(
                      index: this.tabIndex,
                      onPressed: changeTab,
                    ),
                  ),
                  AuthenticationForm(
                    isSignUpForm: this.tabIndex == 0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
