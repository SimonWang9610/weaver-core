import 'dart:convert';
import 'package:flutter/foundation.dart'; // mapEquals

class WeaverRequest {
  final String action;
  final String userid;
  final String token;
  Map<String, dynamic>? params;

  WeaverRequest({
    required this.action,
    required this.userid,
    required this.token,
    this.params,
  });

  WeaverRequest copyWith({
    required String action,
    required String userid,
    required String token,
    Map<String, dynamic>? params,
  }) {
    return WeaverRequest(
      action: action,
      userid: userid,
      token: token,
      params: params ?? this.params,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'action': action,
      'userid': userid,
      'token': token,
      'params': params,
    };
  }

  factory WeaverRequest.fromMap(Map<String, dynamic> map) {
    return WeaverRequest(
      action: map['action'] as String,
      userid: map['userid'] as String,
      token: map['token'] as String,
      params: Map.from(map['params']),
    );
  }

  // This message is created by app, so we have to 
  // encode it to a JSON string in order to send it.
  String toJson() => json.encode(toMap());
  factory WeaverRequest.fromJson(String source) => WeaverRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeaverRequest(action: $action, userid: $userid)';
  }

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is WeaverRequest && o.action == action && o.userid == userid && o.token == token && mapEquals(o.params, params);
  }

  @override
  int get hashCode {
    return action.hashCode ^ userid.hashCode ^ token.hashCode ^ params.hashCode;
  }
}
