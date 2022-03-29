import 'dart:convert';
import 'package:weaver_core/base/vo/tree_vo.dart';
import 'tab_page.dart';

class Menu extends TreeData {
  String? id;
  String? pid;
  String? nameEn;
  String? nameZh;
  String? icon;

  toTabPage() {
    return TabPage(
      id: id,
      nameEn: nameEn,
      nameZh: nameZh,
    );
  }

  Menu({
    this.id,
    this.pid,
    this.nameEn,
    this.nameZh,
    this.icon,
  }) : super(id, pid);

  Menu copyWith({
    String? id,
    String? pid,
    String? nameEn,
    String? nameZh,
    String? icon,
  }) {
    return Menu(
      id: id ?? this.id,
      pid: pid ?? this.pid,
      nameEn: nameEn ?? this.nameEn,
      nameZh: nameZh ?? this.nameZh,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pid': pid,
      'name_en': nameEn,
      'name_zh': nameZh,
      'icon': icon,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'],
      pid: map['pid'],
      nameEn: map['name_en'],
      nameZh: map['name_zh'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Menu(id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Menu && o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
