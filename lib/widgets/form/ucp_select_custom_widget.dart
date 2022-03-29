import 'package:flutter/material.dart';

class UcpSelectCustomWidget<T> extends FormField<T> {
  UcpSelectCustomWidget(
    BuildContext context, {
    this.controller,
    this.initialValueLabel,
    Key? key,
    double? width,
    double? padding,
    String? label,
    T? initialValue,
    FormFieldSetter<T>? onSaved,
    Function? getValueLabel,
    Function? getValue,
    required Widget popWidget,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          builder: (FormFieldState<T> field) {
            final _UcpSelectCustomWidgetState state = field as _UcpSelectCustomWidgetState;
            return Container(
              padding: EdgeInsets.all(padding ?? 20.0),
              width: width ?? double.infinity,
              child: TextField(
                readOnly: true,
                controller: state._effectiveController,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => popWidget),
                  ).then((res) {
                    if (res == null) {
                      return;
                    }
                    String valueLabel = getValueLabel == null ? res.toString() : getValueLabel(res);
                    initialValue = getValue == null ? res.toString() : getValue(res);
                    field.didChange(initialValue);
                    state.didChangeValueLabel(valueLabel);
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: label,
                ),
              ),
            );
          },
        );

  final TextEditingController? controller;

  final String? initialValueLabel;

  @override
  _UcpSelectCustomWidgetState<T> createState() => _UcpSelectCustomWidgetState();
}

class _UcpSelectCustomWidgetState<T> extends FormFieldState<T> {
  TextEditingController? _controller;

  TextEditingController? get _effectiveController => widget.controller ?? _controller;

  @override
  UcpSelectCustomWidget<T> get widget => (super.widget as UcpSelectCustomWidget) as UcpSelectCustomWidget<T>;

  @override
  void initState() {
    super.initState();
    if (_controller == null) {
      _controller = TextEditingController(text: widget.initialValueLabel);
    }
  }

  @override
  void reset() {
    _effectiveController!.text = widget.initialValueLabel ?? '';
    super.reset();
  }

  didChangeValueLabel(String valueLable) {
    _effectiveController!.text = valueLable;
  }
}
