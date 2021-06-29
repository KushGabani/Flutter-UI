import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants.dart';

class PhoneInput extends StatefulWidget {
  final String controller;
  final void Function(String) onChange;

  const PhoneInput({
    Key key,
    @required this.controller,
    this.onChange,
  }) : super(key: key);

  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber phone) {
        this.widget.onChange(phone.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        showFlags: false,
        setSelectorButtonAsPrefixIcon: true,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: ColorPallete.kDarkBlueColor),
      inputDecoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            width: 1.5,
            color: ColorPallete.kDarkBlueColor.withOpacity(0.2),
          ),
        ),
        labelText: "Phone Number",
        labelStyle: TextStyle(
          color: ColorPallete.kLightTextColor,
          fontSize: 18.0,
        ),
        suffixIcon: Icon(
          Icons.phone,
          color: ColorPallete.kDarkBlueColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            width: 1.5,
            color: ColorPallete.kDarkBlueColor,
          ),
        ),
      ),
    );
  }
}
