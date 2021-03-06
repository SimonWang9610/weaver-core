import 'package:flutter/material.dart';

class UcpButtonBar extends StatelessWidget {
  UcpButtonBar({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    var result = Padding(
      padding: EdgeInsets.all(5),
      child: Wrap(
        children: children,
        spacing: 5.0,
        runSpacing: 5.0,
      ),
    );
    return result;
  }
}
