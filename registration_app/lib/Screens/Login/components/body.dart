import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registration_app/Screens/Login/components/already_have_an_account.dart';
import 'package:registration_app/Screens/Login/components/background.dart';
import 'package:registration_app/Screens/Login/components/rounded_input_text_field.dart';
import 'package:registration_app/Screens/Login/components/rounded_password_field.dart';
import 'package:registration_app/Screens/Login/components/text_input_field_container.dart';
import 'package:registration_app/Screens/Signup/signup_screen.dart';
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
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              RoundedInputTextField(
                hintText: "Email",
                fieldIcon: Icons.person,
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                hintText: "Password",
                fieldIcon: Icons.lock,
                onChanged: (value) {},
                suffixIcon: Icons.visibility,
              ),
              RoundedButton(
                text: "LOGIN",
                textColor: Colors.white,
                color: kPrimaryColor,
              ),
              AlreadyHaveAnAccount(
                isLogin: true,
                pressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
