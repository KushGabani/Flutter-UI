import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import './custom_form_field.dart';
import './../constants.dart';
import './../Screens/HomeScreen.dart';
import './../Components/snackbar_content.dart';
import './../Components/sign_in_with_button.dart';
import './../Components/submit_button.dart';
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
        SignInWithButton(
          provider: "Google",
          isLight: true,
          onPressed: _onSubmitWithGoogle,
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
    } else if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackbarContent(
            text: "Passwords do not match",
            error: true,
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: ColorPallete.kAccentColor,
        ),
      );
    } else {
      String response = await AuthMethods.signUp(
          _emailController.text, _passwordController.text);
      switch (response.toString()) {
        case "weak-password":
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: SnackbarContent(
                  text: "Create a stronger password",
                  error: true,
                ),
                duration: const Duration(seconds: 1),
                backgroundColor: ColorPallete.kAccentColor,
              ),
            );
          }
          break;

        case "email-already-in-use":
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: SnackbarContent(
                  text: "The user already exists",
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
                  text: "User Registered.",
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
