import 'dart:convert';

class Like {
  final String id;
  final String creator;
  final String created;
  final String nickname;

  Like({
    required this.id,
    required this.creator,
    required this.created,
    required this.nickname,
  });

  Like copyWith({
    required String id,
    required String creator,
    required String created,
    required String nickname,
  }) {
    return Like(
      id: id,
      creator: creator,
      created: created,
      nickname: nickname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creator': creator,
      'created': created,
      'nickname': nickname,
    };
  }

  factory Like.fromMap(Map<String?, dynamic> map) {
    return Like(
      id: map['id'] as String,
      creator: map['creator'] as String,
      created: map['created'] as String,
      nickname: map['nickname'] as String,
    );
  }

  //String toJson() => json.encode(toMap());
  // toJson() must return a Map<String, dynamic> in order to jsonEncode(Like)
  Map<String, dynamic> toJson() => toMap();
  factory Like.fromJson(String source) => Like.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Like(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Like && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
