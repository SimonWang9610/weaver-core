import 'dart:convert';

class FormFieldModel {
  String id;
  String label;
  String type;
  String? dcode; // dictionary code
  dynamic? value; // select date number boolean string
  bool? mandatory;
  bool? obscure;
  bool? readonly;
  bool? hidden;

  FormFieldModel({
    required this.id,
    required this.label,
    required this.type,
    this.dcode,
    this.value,
    this.mandatory,
    this.obscure,
    this.readonly,
    this.hidden,
  });

  FormFieldModel copyWith({
    required String id,
    required String label,
    required String type,
    String? dcode,
    dynamic? value,
    bool? mandatory,
    bool? obscure,
    bool? readonly,
    bool? hidden,
  }) {
    return FormFieldModel(
      id: id,
      label: label,
      type: type,
      dcode: dcode ?? this.dcode,
      value: value ?? this.value,
      mandatory: mandatory ?? this.mandatory,
      obscure: obscure ?? this.obscure,
      readonly: readonly ?? this.readonly,
      hidden: hidden ?? this.hidden,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'type': type,
      'dcode': dcode,
      'value': value,
      'mandatory': mandatory,
      'obscure': obscure,
      'readonly': readonly,
      'hidden': hidden,
    };
  }

  factory FormFieldModel.fromMap(Map<String, dynamic> map) {
    return FormFieldModel(
      id: map['id'] as String,
      label: map['label'] as String,
      type: map['type'] as String,
      dcode: map['dcode'],
      value: map['value'],
      mandatory: map['mandatory'],
      obscure: map['obscure'],
      readonly: map['readonly'],
      hidden: map['hidden'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FormFieldModel.fromJson(String source) => FormFieldModel.fromMap(json.decode(source));

  @override
  String toString() => 'FormFieldModel(id: $id, label: $label, type: $type, value: $value)';

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is FormFieldModel && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
