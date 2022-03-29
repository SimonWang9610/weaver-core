import 'package:flutter/material.dart';

class UcpButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? tip;
  final EdgeInsets? padding;
  final Color? iconColor;

  UcpButton({this.label, this.iconColor, this.iconData, this.onPressed, this.tip, this.padding});

  @override
  Widget build(BuildContext context) {
    Widget result;
    if (iconData != null) {
      if (label == null) {
        result = IconButton(
          icon: Icon(
            iconData,
            color: iconColor,
          ),
          onPressed: onPressed,
        );
      } else {
        result = ElevatedButton.icon(
          icon: Icon(
            iconData,
            color: iconColor,
          ),
          label: Text(this.label!),
          onPressed: onPressed,
        );
      }

      if (this.padding != null) {
        result = Container(padding: this.padding, child: result);
      }
    } else {
      result = ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: const Color(0xff1b447b),
        ),
        child: Container(
          //margin: const EdgeInsets.all(12),
          child: Text(
            this.label ?? '',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'halter',
              fontSize: 14,
            ),
          ),
        ),
        onPressed: onPressed,
      );
    }

    if (tip != null) {
      result = Tooltip(
        child: result,
        message: tip!,
      );
    }
    return result;
  }
}
