import 'dart:convert';
import 'like.dart';
import 'comment.dart';
import 'moment_asset.dart';

class MomentNotif {
  final String id;
  final String content;
  final List<Like> likes;
  final List<Comment> comments;
  final List<MomentAsset> assets;

  MomentNotif({
    required this.id,
    required this.content,
    required this.likes,
    required this.comments,
    required this.assets,
  });

  factory MomentNotif.fromMap(Map<String?, dynamic> map) {
    return MomentNotif(
      id: map['id'] as String,
      content: map['content'] as String,
      likes: map['likes'] == null ? [] : List<Like>.from(map['likes'].map((x) => Like.fromMap(x))),
      comments: map['comments'] == null ? [] : List<Comment>.from(map['comments'].map((x) => Comment.fromMap(x))),
      assets: map['assets'] == null ? [] : List<MomentAsset>.from(map['assets'].map((x) => MomentAsset.fromMap(x))),
    );
  }

  @override
  String toString() {
    return 'MomentNotif(id: $id)';
  }

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is MomentNotif && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
