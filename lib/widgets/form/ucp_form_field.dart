import 'package:flutter/material.dart';

class UcpFormField extends StatefulWidget {
  final double? width;
  final double? padding;
  final Function(UcpFormFieldState) builder;

  UcpFormField({
    Key? key,
    required this.builder,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => UcpFormFieldState();
}

class UcpFormFieldState extends State<UcpFormField> {
  didChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.padding ?? 10.0),
      width: widget.width ?? double.infinity,
      child: widget.builder(this),
    );
  }
}
