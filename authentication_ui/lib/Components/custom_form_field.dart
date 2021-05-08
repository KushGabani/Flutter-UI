import 'package:flutter/material.dart';

import '../constants.dart';

class CustomFormField extends StatefulWidget {
  final String formLabel;
  final IconData suffixIcon;
  final String errorText;

  const CustomFormField({
    Key key,
    this.formLabel,
    this.suffixIcon,
    this.errorText,
  }) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  double opacity = 0.3;
  TextEditingController _textController = TextEditingController();
  bool hasError = false;

  void _onFocus(bool focus) {
    setState(() {
      this.opacity = focus ? 1.0 : 0.3;
      this.hasError = !this.hasError;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Focus(
        onFocusChange: (focus) => _onFocus(focus),
        child: TextField(
          controller: _textController,
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
            labelText: widget.formLabel,
            labelStyle: TextStyle(
              color: ColorPallete.kDarkBlueColor.withOpacity(this.opacity),
              fontSize: 18.0,
            ),
            helperText: this.hasError ? widget.errorText : " ",
            helperStyle: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: Icon(
              widget.suffixIcon,
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
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontSize: 18.0,
            color: ColorPallete.kDarkBlueColor,
          ),
        ),
      ),
    );
  }
}
