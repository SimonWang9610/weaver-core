import 'dart:convert';

class ResBody<T> {
  bool? success;
  int? code;
  String? message;
  T? data;
  ResBody({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  ResBody<T> copyWith({
    bool? success,
    int? code,
    String? message,
    T? data,
  }) {
    return ResBody<T>(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'code': code,
      'message': message,
      'data': data,
    };
  }

  factory ResBody.fromMap(Map<String, dynamic> map) {

    return ResBody<T>(
      success: map['success'],
      code: map['code'],
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResBody.fromJson(String source) => ResBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResBody(success: $success, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ResBody<T> &&
      o.success == success &&
      o.code == code &&
      o.message == message &&
      o.data == data;
  }

  @override
  int get hashCode {
    return success.hashCode ^
      code.hashCode ^
      message.hashCode ^
      data.hashCode;
  }
}
