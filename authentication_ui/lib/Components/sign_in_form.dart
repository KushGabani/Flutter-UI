import 'package:clove/Components/sign_in_with_button.dart';
import 'package:clove/Components/submit_button.dart';
import 'package:flutter/material.dart';

import 'custom_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 40.0,
      ),
      child: Column(
        children: <Widget>[
          CustomFormField(
            formLabel: "Username",
            suffixIcon: Icons.person,
            errorText: "Hmm, This is not a valid username",
          ),
          CustomFormField(
            formLabel: "Email",
            suffixIcon: Icons.alternate_email_rounded,
            errorText: "Not a valid email id",
          ),
          CustomFormField(
            formLabel: "Password",
            suffixIcon: Icons.lock_rounded,
            errorText: "Password must contain 8 characters",
          ),
          SubmitButton(text: "Sign Up", onPressed: () {}),
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
      ),
    );
  }
}