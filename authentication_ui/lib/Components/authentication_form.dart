import 'package:flutter_svg/flutter_svg.dart';

import './../constants.dart';
import 'package:flutter/material.dart';
import 'sign_in_form.dart';

class AuthenticationForm extends StatelessWidget {
  final bool isSignUpForm;

  const AuthenticationForm({
    Key key,
    this.isSignUpForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.isSignUpForm
        ? SignUpForm()
        : Center(
            child: Text("Hello World"),
          );
  }
}