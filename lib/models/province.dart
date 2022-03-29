import 'dart:convert';

class Province {
  String? id;
  String? name;

  Province({
    this.id,
    this.name,
  });

  Province copyWith({
    String? id,
    String? name,
  }) {
    return Province(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Province.fromMap(Map<String?, dynamic> map) {
    return Province(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Province.fromJson(String source) => Province.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Province(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Province &&
        o.id == id &&
        o.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode;
  }
}
