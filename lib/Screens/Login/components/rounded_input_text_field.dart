import 'package:flutter/material.dart';
import 'package:registration_app/Screens/Login/components/text_input_field_container.dart';
import 'package:registration_app/constants.dart';

class RoundedInputTextField extends StatelessWidget {
  final String hintText;
  final IconData fieldIcon;
  final ValueChanged<String> onChanged;

  RoundedInputTextField({
    Key key,
    @required this.hintText,
    @required this.fieldIcon,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputFieldContainer(
      child: TextField(
        onChanged: this.onChanged,
        // textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          icon: Icon(
            this.fieldIcon,
            color: kPrimaryColor,
          ),
          hintText: this.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
