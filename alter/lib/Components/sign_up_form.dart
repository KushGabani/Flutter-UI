import 'package:flutter/material.dart';

import './../Components/sign_in_with_button.dart';
import './../Components/submit_button.dart';
import '../constants.dart';
import './custom_form_field.dart';

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
          onSubmit: (){}
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SignInWithButton(
              With: "Google",
              onPressed: () {},
            ),
            SizedBox(width: 40.0,),
            SignInWithButton(
              With: "Apple",
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}