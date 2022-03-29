import 'dart:convert';

class ChatMember {
  String id;
  String email;
  String nickname;
  String? firstName;
  String? lastName;
  String? avatar;
  String? created;

  ChatMember({
    required this.id,
    required this.email,
    required this.nickname,
    this.firstName,
    this.lastName,
    this.avatar,
    this.created,
  });

  ChatMember copyWith({
    required String id,
    required String email,
    required String nickname,
    String? firstName,
    String? lastName,
    String? avatar,
    String? created,
  }) {
    return ChatMember(
      id: id,
      email: email,
      nickname: nickname,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nickname': nickname,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'created': created,
    };
  }

  factory ChatMember.fromMap(Map<String?, dynamic> map) {
    return ChatMember(
      id: map['id'] as String,
      email: map['email'] as String,
      nickname: map['nickname'] as String,
      firstName: map['first_name'],
      lastName: map['last_name'],
      avatar: map['avatar'],
      created: map['created'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMember.fromJson(String source) => ChatMember.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatMember(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChatMember && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
