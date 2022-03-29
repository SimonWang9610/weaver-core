import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ucp_form_field.dart';

class UcpInput extends UcpFormField {
  UcpInput({
    Key? key,
    double? width,
    double? padding,
    double? contentPadding,
    int? maxLines,
    String? label,
    String? value,
    ValueChanged? onChange,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool? enable,
    bool obscureText = false,
    bool required = false,
    List<TextInputFormatter>? inputFormatters,
  }) : super(
          key: key,
          width: width,
          padding: padding,
          builder: (UcpFormFieldState state) {
            return TextFormField(
              //maxLines: maxLines,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabled: enable ?? true,
                labelText: label,
                contentPadding: EdgeInsets.symmetric(horizontal: contentPadding ?? 10),
              ),
              controller: TextEditingController(text: value),
              inputFormatters: inputFormatters ?? [],
              onChanged: (v) {
                if (onChange != null) {
                  onChange(v);
                }
              },
              onSaved: (v) {
                if (onSaved != null) {
                  onSaved(v);
                }
              },
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
