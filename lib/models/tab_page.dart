import 'dart:convert';
import 'package:flutter/material.dart';

class TabPage {
  String? id;
  String? nameEn;
  String? nameZh;
  String? url;
  Widget? widget;

  TabPage({
    this.id,
    this.nameEn,
    this.nameZh,
    this.url,
    this.widget,
  });

  TabPage copyWith({
    String? id,
    String? nameEn,
    String? nameZh,
    String? url,
    Widget? widget,
  }) {
    return TabPage(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameZh: nameZh ?? this.nameZh,
      url: url ?? this.url,
      widget: widget ?? this.widget,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_zh': nameZh,
      'url': url,
      'widget': widget?.toStringShort(),
    };
  }

  factory TabPage.fromMap(Map<String, dynamic> map) {

    return TabPage(
      id: map['id'],
      nameEn: map['name_en'],
      nameZh: map['name_zh'],
      url: map['url'],
      // widget: Widget.fromMap(map['widget']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TabPage.fromJson(String source) => TabPage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TabPage(id: $id, nameEn: $nameEn, nameZh: $nameZh, url: $url, widget: $widget)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TabPage && o.id == id && o.nameEn == nameEn && o.nameZh == nameZh && o.url == url && o.widget == widget;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nameEn.hashCode ^ nameZh.hashCode ^ url.hashCode ^ widget.hashCode;
  }
}
