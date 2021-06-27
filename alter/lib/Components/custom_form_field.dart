import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String field;
  final IconData icon;
  final TextInputType inputType;

  const CustomFormField({
    Key key,
    @required this.controller,
    @required this.icon,
    @required this.field,
    this.inputType,
  }) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  double opacity = 0.3;

  void _onFocus(bool focus) {
    setState(() {
      this.opacity = focus ? 1.0 : 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focus) => _onFocus(focus),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.78,
        child: TextFormField(
          controller: this.widget.controller,
          cursorColor: ColorPallete.kDarkBlueColor,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: BorderSide(
                width: 1.5,
                color: ColorPallete.kDarkBlueColor.withOpacity(0.2),
              ),
            ),
            labelText: this.widget.field,
            labelStyle: TextStyle(
              color: ColorPallete.kLightTextColor.withOpacity(this.opacity),
              fontSize: 18.0,
            ),
            suffixIcon: Icon(
              this.widget.icon,
              color: ColorPallete.kDarkBlueColor.withOpacity(this.opacity),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: BorderSide(
                width: 1.5,
                color: ColorPallete.kDarkBlueColor,
              ),
            ),
          ),
          keyboardType: this.widget.inputType,
          obscureText: this.widget.field == "Email" ? false : true,
          style: TextStyle(
            fontSize: 18.0,
            color: ColorPallete.kDarkBlueColor,
          ),
        ),
      ),
    );
  }
}
