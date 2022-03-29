import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'page_model.dart';

class ReqBody {
  PageModel? page;
  Map? params;

  ReqBody({
    this.page,
    this.params,
  });

  ReqBody copyWith({
    PageModel? page,
    Map? params,
  }) {
    return ReqBody(
      page: page ?? this.page,
      params: params ?? this.params,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page?.toMap(),
      'params': params,
    };
  }

  factory ReqBody.fromMap(Map<String, dynamic> map) {

    return ReqBody(
      page: PageModel.fromMap(map['page']),
      params: Map.from(map['params']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReqBody.fromJson(String source) => ReqBody.fromMap(json.decode(source));

  @override
  String toString() => 'ReqBody(page: $page, params: $params)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ReqBody && o.page == page && mapEquals(o.params, params);
  }

  @override
  int get hashCode => page.hashCode ^ params.hashCode;
}
