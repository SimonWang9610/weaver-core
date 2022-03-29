import 'dart:convert';

import '../models/contact/contact.dart';
import 'constants.dart';
import 'store_util.dart';

class ContactUtil {
  static List<Contact> getContacts() {
    var data = StoreUtil.read(Constants.CODE_CONTACTS);
    if (data == null) {
      return [];
    }
    var json = jsonDecode(data);
    var list = List.from(json);
    return list.map((e) => Contact.fromMap(e)).toList();
  }

  static saveContacts(List<Contact> contacts) {
    StoreUtil.write(Constants.CODE_CONTACTS, jsonEncode(contacts));
  }
}
