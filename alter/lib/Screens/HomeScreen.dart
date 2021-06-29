import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './../Components/snackbar_notification.dart';
import './SignUpScreen.dart';
import './../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30.0),
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
                "Hello! from Alter",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                  color: ColorPallete.kSecondaryColor,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Hope you enjoyed the sign in experience",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: ColorPallete.kSecondaryLightColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () => this._signOut(context),
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
                    "Sign Out",
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
    );
  }

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      snackbarNotification(context, "Signed Out", false);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      snackbarNotification(context, "Oops! looks like a server issue", true);
    } catch(e) {
      print(e);
    }
  }
}
