import 'dart:convert';

class Contact {
  String id;
  String email;
  String nickname;
  bool isInviter;
  String? firstName;
  String? middleName;
  String? lastName;
  String? avatar;
  String? created;
  String? accepted;

  Contact({
    required this.id,
    required this.email,
    required this.nickname,
    required this.isInviter,
    this.firstName,
    this.middleName,
    this.lastName,
    this.avatar,
    this.created,
    this.accepted,
  });

  Contact copyWith({
    required String id,
    required String email,
    required String nickname,
    required bool isInviter,
    String? firstName,
    String? middleName,
    String? lastName,
    String? avatar,
    String? created,
    String? accepted,
  }) {
    return Contact(
      id: id,
      email: email,
      nickname: nickname,
      isInviter: isInviter,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      created: created ?? this.created,
      accepted: accepted ?? this.accepted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nickname': nickname,
      'is_inviter': isInviter,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'avatar': avatar,
      'created': created,
      'accepted': accepted,
    };
  }

  factory Contact.fromMap(Map<String?, dynamic> map) {
    return Contact(
      id: map['id'] as String,
      email: map['email'] as String,
      nickname: map['nickname'] as String,
      isInviter: map['is_inviter'] == 1 ? true : false,
      firstName: map['first_name'],
      middleName: map['middle_name'],
      lastName: map['last_name'],
      avatar: map['avatar'],
      created: map['created'],
      accepted: map['accepted'],
    );
  }

  //String toJson() => json.encode(toMap());
  // toJson() must return a Map<String, dynamic> in order to jsonEncode(Contact)
  Map<String, dynamic> toJson() => toMap();
  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Contact(id: $id, email: $email)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Contact && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
