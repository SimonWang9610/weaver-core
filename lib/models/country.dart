import 'dart:convert';

class Country {
  String? id;
  String? nameEn;
  String? nameFr;
  String? nameZh;
  String? callingCode;

  Country({
    this.id,
    this.nameEn,
    this.nameFr,
    this.nameZh,
    this.callingCode,
  });

  Country copyWith({
    String? id,
    String? nameEn,
    String? nameFr,
    String? nameZh,
    String? callingCode,
  }) {
    return Country(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameFr: nameFr ?? this.nameFr,
      nameZh: nameZh ?? this.nameZh,
      callingCode: callingCode ?? this.callingCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_fr': nameFr,
      'name_zh': nameZh,
      'calling_code': callingCode,
    };
  }

  factory Country.fromMap(Map<String?, dynamic> map) {
    return Country(
      id: map['id'],
      nameEn: map['name_en'],
      nameFr: map['name_fr'],
      nameZh: map['name_zh'],
      callingCode: map['calling_code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Country(id: $id, nameEn: $nameEn)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Country &&
        o.id == id &&
        o.nameEn == nameEn;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nameEn.hashCode;
  }
}
