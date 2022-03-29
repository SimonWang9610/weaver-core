import 'dart:convert';

class ChatMessage {
  String id;
  String chatId;
  String type;
  String created;
  String sender;
  bool read;
  String? text;
  String? image;
  int? pid;

  ChatMessage({
    required this.id,
    required this.chatId,
    required this.type,
    required this.created,
    required this.sender,
    required this.read,
    this.text,
    this.image,
    this.pid,
  });

  ChatMessage copyWith({
    required String id,
    required String chatId,
    required String type,
    required String created,
    required String sender,
    required int time,
    required bool read,
    String? text,
    String? image,
    int? pid,
  }) {
    return ChatMessage(
      id: id,
      chatId: chatId,
      type: type,
      created: created,
      sender: sender,
      read: read,
      text: text ?? this.text,
      image: image ?? this.image,
      pid: pid ?? this.pid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chat_id': chatId,
      'type': type,
      'created': created,
      'sender': sender,
      'read': read,
      'text': text,
      'image': image,
      'pid': pid,
    };
  }

  factory ChatMessage.fromMap(Map<String?, dynamic> map) {
    return ChatMessage(
      id: map['id'] as String,
      chatId: map['chat_id'] as String,
      type: map['type'] as String,
      created: map['created'] as String,
      sender: map['sender'] as String,
      read: map['read'] as bool,
      text: map['text'],
      image: map['image'],
      pid: map['pid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatMessage(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChatMessage && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
