import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './../constants.dart';
import './snackbar_content.dart';
import './custom_form_field.dart';
import './../resources/auth_methods.dart';
import './../Components/sign_in_with_button.dart';
import './../Components/submit_button.dart';
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
        SubmitButton(
            text: "Sign In",
            isSignUp: false,
            onSubmit: _onSubmitWithEmail,
        ),
        SignInWithButton(
          provider: "Google",
          isLight: false,
          onPressed: _onSubmitWithGoogle,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }

  void _onSubmitWithEmail() async {
    if (_emailController.text == "" ||
        _passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackbarContent(
            text: "Email/Password cannot be blank",
            error: true,
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: ColorPallete.kAccentColor,
        ),
      );
    } else if (!EmailValidator.validate(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackbarContent(
            text: "Not a valid Email",
            error: true,
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: ColorPallete.kAccentColor,
        ),
      );
    } else {
      String response = await AuthMethods.signIn(
          _emailController.text, _passwordController.text);
      switch (response.toString()) {
        case "user-not-found":
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: SnackbarContent(
                  text: "The user does not exist",
                  error: true,
                ),
                duration: const Duration(seconds: 1),
                backgroundColor: ColorPallete.kAccentColor,
              ),
            );
          }
          break;

        case "wrong-password":
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: SnackbarContent(
                  text: "Incorrect Password",
                  error: true,
                ),
                duration: const Duration(seconds: 1),
                backgroundColor: ColorPallete.kAccentColor,
              ),
            );
          }
          break;

        case "error":
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: SnackbarContent(
                  text: "Oops! Looks like a server issue",
                  error: true,
                ),
                duration: const Duration(seconds: 1),
                backgroundColor: ColorPallete.kAccentColor,
              ),
            );
          }
          break;

        case "success":
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: SnackbarContent(
                  text: "User Signed In.",
                  error: false,
                ),
                duration: const Duration(seconds: 1),
                backgroundColor: ColorPallete.kSuccessAccentColor,
              ),
            );

            goToHome();
          }
          break;
      }
    }
  }

  void _onSubmitWithGoogle() async {
    UserCredential user = await AuthMethods.signInWithGoogle();
    print(user.toString());
    print("===============================");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SnackbarContent(
          text: "User Registered.",
          error: false,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: ColorPallete.kSuccessAccentColor,
      ),
    );
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
}