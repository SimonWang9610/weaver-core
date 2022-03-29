import 'package:flutter/material.dart';
import 'package:weaver_core/base/vo/select_option_vo.dart';
import 'ucp_form_field.dart';

class UcpSelect extends UcpFormField {
  UcpSelect({
    Key? key,
    double? width,
    String? label,
    String? value,
    ValueChanged? onChange,
    FormFieldSetter<String>? onSaved,
    List<SelectOptionVO> dataList = const [],
    FormFieldValidator<String>? validator,
    bool required = false,
  }) : super(
          key: key,
          width: width,
          builder: (UcpFormFieldState state) {
            return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: label,
              ),
              value: value,
              items: dataList.map((v) {
                return DropdownMenuItem<String>(
                  value: v.value as String?,
                  child: Text(v.label!),
                );
              }).toList(),
              onChanged: (v) {
                value = v;
                if (onChange != null) {
                  onChange(v);
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
