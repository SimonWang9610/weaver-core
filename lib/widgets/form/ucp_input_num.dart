import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ucp_input.dart';

class UcpInputNum extends UcpInput {
  UcpInputNum({
    Key? key,
    double? width,
    String? label,
    num? value,
    bool? enable,
    ValueChanged? onChange,
    FormFieldSetter<num>? onSaved,
    FormFieldValidator<String>? validator,
  }) : super(
          key: key,
          width: width,
          label: label,
          value: value?.toString(),
          enable: enable,
          onChange: onChange,
          onSaved: (String? v) {
            onSaved!((v == null || v.length == 0) ? 0 : num.parse(v));
          },
          validator: validator,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
        );
}
