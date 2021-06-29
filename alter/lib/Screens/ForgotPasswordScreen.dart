import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './../constants.dart';
import './../Components/custom_form_field.dart';
import './../Components/snackbar_notification.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset("assets/icons/back.svg"),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  SvgPicture.asset(
                    "assets/images/md_logo.svg",
                    width: 100.0,
                  ),
                  SizedBox(height: 80.0),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                      color: ColorPallete.kSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Get a password reset link at your\nassociated email id.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: ColorPallete.kSecondaryLightColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                  CustomFormField(
                    controller: _emailController,
                    icon: Icons.alternate_email_rounded,
                    field: "Email",
                    inputType: TextInputType.emailAddress,
                  ),
                  GestureDetector(
                    onTap: _sendPasswordResetLink,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 15.0),
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorPallete.kDarkBlueColor,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text(
                        "Get Reset Link",
                        style: TextStyle(
                          color: ColorPallete.kLightBlueColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Send any feedback or bug report at alterauth@reachout.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorPallete.kSecondaryLightColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _sendPasswordResetLink() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);

      snackbarNotification(context, "Reset mail reset", false);
    } catch (e) {
      snackbarNotification(context, "Oops! Looks like a server issue", true);
    }
  }
}
