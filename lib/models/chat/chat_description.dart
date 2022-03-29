import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChatDescription {
  final String chatId;
  final List<String> members;
  final String title;
  final String? lastMessageText;
  final String? partnerId;
  final String? partnerName;
  final String? partnerAvatar;
  final int unreadCount;
  final bool isGroupChat;
  ChatDescription({
    required this.chatId,
    required this.members,
    required this.title,
    this.lastMessageText,
    this.partnerId,
    this.partnerName,
    this.partnerAvatar,
    required this.unreadCount,
    required this.isGroupChat,
  });

  ChatDescription copyWith({
    String? chatId,
    List<String>? members,
    String? title,
    String? lastMessageText,
    String? partnerId,
    String? partnerName,
    String? partnerAvatar,
    int? unreadCount,
    bool? isGroupChat,
  }) {
    return ChatDescription(
      chatId: chatId ?? this.chatId,
      members: members ?? this.members,
      title: title ?? this.title,
      lastMessageText: lastMessageText ?? this.lastMessageText,
      partnerId: partnerId ?? this.partnerId,
      partnerName: partnerName ?? this.partnerName,
      partnerAvatar: partnerAvatar ?? this.partnerAvatar,
      unreadCount: unreadCount ?? this.unreadCount,
      isGroupChat: isGroupChat ?? this.isGroupChat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'members': members,
      'title': title,
      'lastMessageText': lastMessageText,
      'partnerId': partnerId,
      'partnerName': partnerName,
      'partnerAvatar': partnerAvatar,
      'unreadCount': unreadCount,
      'isGroupChat': isGroupChat,
    };
  }

  factory ChatDescription.fromMap(Map<String, dynamic> map) {
    return ChatDescription(
      chatId: map['chatId'] ?? '',
      members: List<String>.from(map['members']),
      title: map['title'] ?? '',
      lastMessageText: map['lastMessageText'],
      partnerId: map['partnerId'],
      partnerName: map['partnerName'],
      partnerAvatar: map['partnerAvatar'],
      unreadCount: map['unreadCount']?.toInt() ?? 0,
      isGroupChat: map['isGroupChat'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatDescription.fromJson(String source) =>
      ChatDescription.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatDescription(chatId: $chatId, members: $members, title: $title, lastMessageText: $lastMessageText, partnerId: $partnerId, partnerName: $partnerName, partnerAvatar: $partnerAvatar, unreadCount: $unreadCount, isGroupChat: $isGroupChat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatDescription &&
        other.chatId == chatId &&
        listEquals(other.members, members) &&
        other.title == title &&
        other.lastMessageText == lastMessageText &&
        other.partnerId == partnerId &&
        other.partnerName == partnerName &&
        other.partnerAvatar == partnerAvatar &&
        other.unreadCount == unreadCount &&
        other.isGroupChat == isGroupChat;
  }

  @override
  int get hashCode {
    return chatId.hashCode ^
        members.hashCode ^
        title.hashCode ^
        lastMessageText.hashCode ^
        partnerId.hashCode ^
        partnerName.hashCode ^
        partnerAvatar.hashCode ^
        unreadCount.hashCode ^
        isGroupChat.hashCode;
  }
}
