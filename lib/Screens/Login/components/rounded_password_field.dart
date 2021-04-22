import 'package:flutter/material.dart';
import 'package:registration_app/Screens/Login/components/text_input_field_container.dart';
import 'package:registration_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final IconData fieldIcon, suffixIcon;
  final ValueChanged<String> onChanged;

  RoundedPasswordField({
    Key key,
    this.hintText,
    this.fieldIcon,
    this.suffixIcon,
    this.onChanged
}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return TextInputFieldContainer(
      child: TextField(
        onChanged: this.onChanged,
        obscureText: true,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          icon: Icon(
            this.fieldIcon,
            color: kPrimaryColor,
          ),
          hintText: this.hintText,
          border: InputBorder.none,
          suffixIcon: Icon(
            this.suffixIcon,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
