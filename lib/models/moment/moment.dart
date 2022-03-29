import 'dart:convert';
import 'like.dart';
import 'comment.dart';
import 'moment_asset.dart';

class Moment {
  final String id;
  final String creator;
  final String content;
  final String created;
  final String nickname;
  String? avatar;
  final List<Like> likes;
  final List<Comment> comments;
  final List<MomentAsset> assets;

  Moment({
    required this.id,
    required this.creator,
    required this.content,
    required this.created,
    required this.nickname,
    this.avatar,
    required this.likes,
    required this.comments,
    required this.assets,
  });

  Moment copyWith({
    required String id,
    required String creator,
    required String content,
    required String created,
    required String nickname,
    String? avatar,
    required List<Like> likes,
    required List<Comment> comments,
    required List<MomentAsset> assets,
  }) {
    return Moment(
      id: id,
      creator: creator,
      content: content,
      created: created,
      nickname: nickname,
      avatar: avatar ?? this.avatar,
      likes: likes,
      comments: comments,
      assets: assets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creator': creator,
      'content': content,
      'created': created,
      'nickname': nickname,
      'avatar': avatar,
      'likes': likes.map((x) => x.toMap()).toList(),
      'comments': comments.map((x) => x.toMap()).toList(),
      'assets': assets.map((x) => x.toMap()).toList(),
    };
  }

  factory Moment.fromMap(Map<String?, dynamic> map) {
    return Moment(
      id: map['id'] as String,
      creator: map['creator'] as String,
      content: map['content'] as String,
      created: map['created'] as String,
      nickname: map['nickname'] as String,
      avatar: map['avatar'],
      likes: map['likes'] == null ? [] : List<Like>.from(map['likes'].map((x) => Like.fromMap(x))),
      comments: map['comments'] == null ? [] : List<Comment>.from(map['comments'].map((x) => Comment.fromMap(x))),
      assets: map['assets'] == null ? [] : List<MomentAsset>.from(map['assets'].map((x) => MomentAsset.fromMap(x))),
    );
  }

  //String toJson() => json.encode(toMap());
  // toJson() must return a Map<String, dynamic> in order to jsonEncode(Moment)
  Map<String, dynamic> toJson() => toMap();
  factory Moment.fromJson(String source) => Moment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Moment(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Moment && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
