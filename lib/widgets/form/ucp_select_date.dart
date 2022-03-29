import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

import 'ucp_form_field.dart';

class UcpSelectDate extends UcpFormField {
  UcpSelectDate(
    BuildContext context, {
    Key? key,
    String? value,
    String? label,
    double? width,
    double? padding,
    ValueChanged? onChange,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool required = false,
  }) : super(
          key: key,
          width: width,
          padding: padding,
          builder: (UcpFormFieldState state) {
            return TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: label,
              ),
              controller: TextEditingController(text: value),
              onChanged: (v) {
                if (onChange != null) {
                  onChange(v);
                }
              },
              onTap: () async {
                DateTime valueDt =
                    isBlank(value) ? DateTime.now() : DateTime.parse(value!);
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: valueDt,
                  firstDate: DateTime(1900, 1),
                  lastDate: DateTime(2031, 12),
                );
                if (picked != null) {
                  value = formatDate(picked, [yyyy, '-', mm, '-', dd]);
                }
                state.didChange();
              },
              onSaved: onSaved,
              validator: (v) {
                if (required && v!.isEmpty) {
                  return 'This field is required.';
                }
                if (validator != null) {
                  return validator(v);
                }
                return null;
              },
            );
          },
        );
}
