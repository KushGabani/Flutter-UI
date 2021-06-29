import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './custom_form_field.dart';
import './sign_in_with_button.dart';
import './submit_button.dart';
import './snackbar_notification.dart';
import './../constants.dart';
import './../resources/auth_methods.dart';
import './../Screens/ForgotPasswordScreen.dart';
import './../Screens/OtpAuthentication.dart';
import './../Screens/HomeScreen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CustomFormField(
          controller: _emailController,
          field: "Email",
          icon: Icons.alternate_email_rounded,
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 30.0,
        ),
        CustomFormField(
          controller: _passwordController,
          field: "Password",
          icon: Icons.lock_rounded,
          inputType: TextInputType.text,
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: size.width * 0.78,
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text(
              "forgot password?",
              style: TextStyle(
                  color: ColorPallete.kDarkBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPasswordScreen(),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        SubmitButton(
          text: "Sign In",
          isSignUp: false,
          onSubmit: _onSubmitWithEmail,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInWithButton(
              provider: "Google",
              isLight: true,
              onPressed: _onSubmitWithGoogle,
            ),
            SizedBox(
              width: 50.0,
            ),
            SignInWithButton(
              provider: "phone",
              isLight: true,
              onPressed: goToVerifyPhone,
            ),
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }

  void _onSubmitWithEmail() async {
    if (_emailController.text == "" || _passwordController.text == "") {
      snackbarNotification(context, "Email/Password cannot be blank", true);
    } else if (!EmailValidator.validate(_emailController.text)) {
      snackbarNotification(context, "Not a valid Email", true);
    } else {
      String response = await AuthMethods.signIn(
          _emailController.text, _passwordController.text);
      switch (response.toString()) {
        case "user-not-found":
          {
            snackbarNotification(context, "The user does not exist", true);
          }
          break;

        case "wrong-password":
          {
            snackbarNotification(context, "Incorrect password", true);
          }
          break;

        case "error":
          {
            snackbarNotification(
                context, "Oops! Looks like a server issue", true);
          }
          break;

        case "success":
          {
            snackbarNotification(context, "User signed in", false);
            goToHome();
          }
          break;
      }
    }
  }

  void _onSubmitWithGoogle() async {
    UserCredential user = await AuthMethods.signInWithGoogle();
    snackbarNotification(context, "User Registered", false);
    goToHome();
  }

  void goToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  goToVerifyPhone() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpAuthentication(),
      ),
    );
  }
}
