import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import './custom_form_field.dart';
import './sign_in_with_button.dart';
import './snackbar_notification.dart';
import './submit_button.dart';
import './../Screens/OtpAuthentication.dart';
import './../Screens/HomeScreen.dart';
import './../resources/auth_methods.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          height: 30.0,
        ),
        CustomFormField(
          controller: _confirmPasswordController,
          field: "Confirm Password",
          icon: Icons.lock_rounded,
          inputType: TextInputType.text,
        ),
        SizedBox(
          height: 30.0,
        ),
        SubmitButton(
          text: "Sign Up",
          isSignUp: true,
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
          width: 40.0,
        ),
      ],
    );
  }

  void _onSubmitWithEmail() async {
    if (_emailController.text == "" ||
        _passwordController.text == "" ||
        _confirmPasswordController.text == "") {
      snackbarNotification(context, "Email/Password cannot be blank", true);
    } else if (!EmailValidator.validate(_emailController.text)) {
      snackbarNotification(context, "Not a valid Email", true);
    } else if (_passwordController.text != _confirmPasswordController.text) {
      snackbarNotification(context, "Passwords do not match", true);
    } else {
      String response = await AuthMethods.signUp(
          _emailController.text, _passwordController.text);
      switch (response.toString()) {
        case "weak-password":
          {
            snackbarNotification(context, "Create a stronger password", true);
          }
          break;

        case "email-already-in-use":
          {
            snackbarNotification(context, "The user already exists", true);
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
            snackbarNotification(context, "User Registered", false);
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

  void goToVerifyPhone() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpAuthentication(),
      ),
    );
  }
}
