import 'dart:convert';
import 'form_group_model.dart';

class FormModel {
  String id;
  String? description;
  List<FormGroupModel> groups;
  bool isViewMode = false;

  FormModel({
    required this.id,
    this.description,
    required this.groups,
  });

  FormModel copyWith({
    required String id,
    String? description,
    required List<FormGroupModel> groups,
  }) {
    return FormModel(
      id: id,
      description: description ?? this.description,
      groups: groups,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'groups': groups.map((x) => x.toMap()).toList(),
    };
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      id: map['id'] as String,
      description: map['description'],
      groups: map['groups'] == null
          ? []
          : List<FormGroupModel>.from(
              map['groups'].map((x) => FormGroupModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormModel.fromJson(String source) =>
      FormModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FormModel(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FormModel && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
