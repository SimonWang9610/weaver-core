import 'package:flutter/material.dart';

class UcpCheckbox extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  UcpCheckbox(this.label, this.value, this.onChanged);

  @override
  _UcpCheckboxState createState() => _UcpCheckboxState();
}

class _UcpCheckboxState extends State<UcpCheckbox> {
  bool? _value;

  @override
  void didUpdateWidget(covariant UcpCheckbox oldWidget) {
    _value = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var result = Container(
      padding: EdgeInsets.all(20),
      child: Wrap(
        children: [
          Text(widget.label),
          Checkbox(
            value: _value,
            onChanged: (v) {
              this._value = v;
              widget.onChanged(v);
              setState(() {});
            },
          ),
        ],
      ),
    );
    return result;
  }
}
