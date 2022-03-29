import 'package:flutter/material.dart';
import 'package:weaver_core/base/vo/select_option_vo.dart';

class UcpToggleButtons extends StatefulWidget {
  final List<SelectOptionVO> options;
  final Object? defaultValue;
  final double? fontSize;
  final ValueChanged? afterOnPress;
  UcpToggleButtons(this.options,
      {this.defaultValue, this.fontSize, this.afterOnPress});
  @override
  UcpToggleButtonsState createState() => UcpToggleButtonsState();
}

class UcpToggleButtonsState extends State<UcpToggleButtons> {
  late List<bool> isSelected;
  @override
  void initState() {
    super.initState();
    this.isSelected =
        widget.options.map((e) => widget.defaultValue == e.value).toList();
  }

  @override
  Widget build(BuildContext context) {
    var list = widget.options
        .map((e) => Padding(
              child: Text(
                e.label!,
                style: TextStyle(fontSize: widget.fontSize),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
            ))
        .toList();
    return ToggleButtons(
      children: list,
      onPressed: (index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            setState(() {
              isSelected[i] = i == index;
            });
          }
          widget.afterOnPress!(widget.options[index].value);
        });
      },
      isSelected: isSelected,
    );
  }
}
