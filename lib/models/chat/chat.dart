import 'dart:convert';

class Chat {
  String id;
  String name;
  List<String> members;
  String created;
  int unreadCount;
  String? lastMessageText;
  String? lastMessageTime;
  String? lastReadTime;

  Chat({
    required this.id,
    required this.name,
    required this.members,
    required this.created,
    required this.unreadCount,
    this.lastMessageText,
    this.lastMessageTime,
    this.lastReadTime,
  });

  Chat copyWith({
    required String id,
    required String name,
    required List<String> members,
    required String created,
    required int unreadCount,
    String? lastMessageText,
    String? lastMessageTime,
    String? lastReadTime,
  }) {
    return Chat(
      id: id,
      name: name,
      members: members,
      created: created,
      unreadCount: unreadCount,
      lastMessageText: lastMessageText ?? this.lastMessageText,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      lastReadTime: lastReadTime ?? this.lastReadTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'members': members,
      'created': created,
      'unread_count': unreadCount,
      'last_message_text': lastMessageText,
      'last_message_time': lastMessageTime,
      'last_read_time': lastReadTime,
    };
  }

  factory Chat.fromMap(Map<String?, dynamic> map) {
    return Chat(
      id: map['id'] as String,
      name: map['name'] as String,
      members: map['members'].split(','),
      created: map['created'] as String,
      unreadCount: map['unread_count'] as int,
      lastMessageText: map['last_message_text'],
      lastMessageTime: map['last_message_time'],
      lastReadTime: map['last_read_time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Chat(id: $id, members: $members)';
  }

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is Chat && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
