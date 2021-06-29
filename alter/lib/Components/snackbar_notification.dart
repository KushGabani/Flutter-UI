import 'package:flutter/material.dart';

import '../constants.dart';
import './snackbar_content.dart';

void snackbarNotification(BuildContext context, String text, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SnackbarContent(
          text: text,
          error: isError,
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: isError ? ColorPallete.kAccentColor : ColorPallete.kSuccessAccentColor,
      ),
    );
}
