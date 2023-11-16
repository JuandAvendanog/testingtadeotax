import 'package:flutter/material.dart';

class Snackbar {
  static showSnackBar(
      BuildContext context, GlobalKey<ScaffoldState> key, String message) {
    if (context == null) return;
    if (key == null) return;
    if (key.currentState == null) return;

    FocusScope.of(context).requestFocus(FocusNode());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
