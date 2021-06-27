import 'package:flutter/material.dart';

import './custom_form_field.dart';
import './../Components/sign_in_with_button.dart';
import './../Components/submit_button.dart';

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