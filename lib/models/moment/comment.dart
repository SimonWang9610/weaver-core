import 'dart:convert';

class Comment {
  final String id;
  final String creator;
  final String content;
  final String created;
  final String nickname;

  Comment({
    required this.id,
    required this.creator,
    required this.content,
    required this.created,
    required this.nickname,
  });

  Comment copyWith({
    required String id,
    required String creator,
    required String content,
    required String created,
    required String nickname,
  }) {
    return Comment(
      id: id,
      creator: creator,
      content: content,
      created: created,
      nickname: nickname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creator': creator,
      'content': content,
      'created': created,
      'nickname': nickname,
    };
  }

  factory Comment.fromMap(Map<String?, dynamic> map) {
    return Comment(
      id: map['id'] as String,
      creator: map['creator'] as String,
      content: map['content'] as String,
      created: map['created'] as String,
      nickname: map['nickname'] as String,
    );
  }

  //String toJson() => json.encode(toMap());
  // toJson() must return a Map<String, dynamic> in order to jsonEncode(Comment)
  Map<String, dynamic> toJson() => toMap();
  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Comment && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
