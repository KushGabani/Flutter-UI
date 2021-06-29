import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../constants.dart';
import './../Components/phone_input.dart';
import './../Components/snackbar_notification.dart';
import './HomeScreen.dart';

class OtpAuthentication extends StatefulWidget {
  const OtpAuthentication({Key key}) : super(key: key);

  @override
  _OtpAuthenticationState createState() => _OtpAuthenticationState();
}

class _OtpAuthenticationState extends State<OtpAuthentication> {
  String _phoneNumber = "";
  String _smsCode = "";
  String _verificationId = "";
  bool didOtpSent = false;

  void otpSent() {
    setState(() {
      this.didOtpSent = !this.didOtpSent;
    });
  }

  void changeNumber(String number) {
    setState(() {
      this._phoneNumber = number;
    });
  }

  void setCode(String code) {
    setState(() {
      this._smsCode = code;
    });
  }

  void setVerificationId(String code) {
    setState(() {
      this._verificationId = code;
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
                    this.didOtpSent ? "OTP Verification" : "Verify Contact",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                      color: ColorPallete.kSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    this.didOtpSent
                        ? "Check your SMS messages. We’ve sent a 4-Digit pin at " +
                            this._phoneNumber
                        : "To finish setting up your account, we’ll need to send you a confirmation code",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: ColorPallete.kSecondaryLightColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                  this.didOtpSent
                      ? OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 38,
                          fieldStyle: FieldStyle.underline,
                          style: TextStyle(
                              fontSize: 28, color: ColorPallete.kDarkBlueColor),
                          onCompleted: (pin) => setCode(pin),
                        )
                      : PhoneInput(
                          controller: this._phoneNumber,
                          onChange: (number) => this.changeNumber(number),
                        ),
                  GestureDetector(
                    onTap:
                        this.didOtpSent ? _onSubmitOTP : _onSubmitPhoneNumber,
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
                        this.didOtpSent ? "Verify OTP" : "Send OTP",
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

  void _onSubmitPhoneNumber() {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this._phoneNumber,
      verificationCompleted: (AuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception.toString());
        bool isInvalidNumber = false;
        if (exception.code == "invalid-phone-number") isInvalidNumber = true;
        snackbarNotification(
          context,
          isInvalidNumber
              ? "Invalid Phone Number"
              : "Oops! Looks like a server issue",
          true,
        );
      },
      codeSent: (String verificationId, int resendToken) async {
        otpSent();
        setVerificationId(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        snackbarNotification(context, "OTP timed out", true);
      },
    );

    snackbarNotification(context, "OTP Sent!", false);
  }

  void _onSubmitOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: this._verificationId, smsCode: this._smsCode);
      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
