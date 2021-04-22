import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registration_app/Screens/Login/components/already_have_an_account.dart';
import 'package:registration_app/Screens/Login/components/rounded_input_text_field.dart';
import 'package:registration_app/Screens/Login/components/rounded_password_field.dart';
import 'package:registration_app/Screens/Login/login_screen.dart';
import 'package:registration_app/Screens/Signup/components/background.dart';
import 'package:registration_app/Screens/Signup/components/or_divider.dart';
import 'package:registration_app/Screens/Signup/components/social_media_icon.dart';
import 'package:registration_app/Screens/Welcome/components.dart/rounded_button.dart';
import 'package:registration_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign Up",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.3,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputTextField(
                hintText: "Email",
                fieldIcon: Icons.person,
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                hintText: "Password",
                fieldIcon: Icons.lock,
                suffixIcon: Icons.visibility,
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "SIGN UP",
                color: kPrimaryColor,
                textColor: Colors.white,
                press: () {},
              ),
              AlreadyHaveAnAccount(
                isLogin: false,
                pressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialMediaIcon(smIcon: "assets/icons/facebook.svg"),
                  SocialMediaIcon(smIcon: "assets/icons/twitter.svg"),
                  SocialMediaIcon(smIcon: "assets/icons/google-plus.svg"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
