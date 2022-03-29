import 'dart:convert';

class MomentAsset {
  final String id;
  final String type;
  final String url;

  MomentAsset({
    required this.id,
    required this.type,
    required this.url,
  });

  MomentAsset copyWith({
    required String id,
    required String type,
    required String url,
  }) {
    return MomentAsset(
      id: id,
      type: type,
      url: url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'url': url,
    };
  }

  factory MomentAsset.fromMap(Map<String?, dynamic> map) {
    return MomentAsset(
      id: map['id'] as String,
      type: map['type'] as String,
      url: map['url'] as String,
    );
  }

  //String toJson() => json.encode(toMap());
  // toJson() must return a Map<String, dynamic> in order to jsonEncode(MomentAsset)
  Map<String, dynamic> toJson() => toMap();
  factory MomentAsset.fromJson(String source) => MomentAsset.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MomentAsset(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MomentAsset && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
