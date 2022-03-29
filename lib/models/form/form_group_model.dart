import 'dart:convert';
import 'form_field_model.dart';

class FormGroupModel {
  String id;
  String label;
  String layout;
  List<FormFieldModel> fields;
  bool isExpanded = false;

  FormGroupModel({
    required this.id,
    required this.label,
    required this.layout,
    required this.fields,
  });

  FormGroupModel copyWith({
    required String id,
    required String label,
    required String layout,
    required List<FormFieldModel> fields,
  }) {
    return FormGroupModel(
      id: id,
      label: label,
      layout: layout,
      fields: fields,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'layout': layout,
      'fields': fields.map((x) => x.toMap()).toList(),
    };
  }

  factory FormGroupModel.fromMap(Map<String, dynamic> map) {
    return FormGroupModel(
      id: map['id'] as String,
      label: map['label'] as String,
      layout: map['layout'] as String,
      fields: map['fields'] == null
          ? []
          : List<FormFieldModel>.from(
              map['fields'].map((x) => FormFieldModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormGroupModel.fromJson(String source) =>
      FormGroupModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FormGroupModel(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FormGroupModel && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
