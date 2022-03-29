import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorUtil {
  static void push(BuildContext context, Widget target) {
    Navigator.push(context, 
      new MaterialPageRoute(
        builder: (context) => target)
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void pushReplacement(BuildContext context, Widget target) {
    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => target));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget target) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => target,
        ),
        (route) => false);
  }
}
