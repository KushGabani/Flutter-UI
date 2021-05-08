import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './../Components/page_header.dart';
import './../Components/tab_switch.dart';
import './../Components/authentication_form.dart';

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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PageHeader(
              header: "Sign Up",
              subtitle:
                  "Come on in! Join the community to always be in the known.",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 25.0),
                    child: Column(
                      children: [
                        TabSwitch(
                          index: this.tabIndex,
                          onPressed: changeTab,
                        ),
                        AuthenticationForm(
                          isSignUpForm: this.tabIndex == 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
