import 'package:flutter/material.dart';
import 'constants.dart';
import 'store_util.dart';

class CommonUtil {
  static bool isEmpty(String value) {
    if (value == null || value == '') {
      return true;
    } else {
      return false;
    }
  }

  static bool isNotEmpty(String value) {
    return !isEmpty(value);
  }

  static getTimestamp() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  static isLocalEn() {
    var locale = StoreUtil.read(Constants.KEY_LOCALE);
    return (locale == null || locale == 'en' || locale == 'en_US');
  }

  static getToken() {
    var token = StoreUtil.read(Constants.KEY_TOKEN);
    return token;
  }

  static getUserid() {
    var id = StoreUtil.read(Constants.KEY_USERID);
    return id;
  }

  static getUserEmail() {
    var email = StoreUtil.read(Constants.KEY_EMAIL);
    return email;
  }

  static getNickname() {
    var nickname = StoreUtil.read(Constants.KEY_NICKNAME);
    return nickname;
  }

  static getAvatar() {
    var avatar = StoreUtil.read(Constants.KEY_AVATAR);
    return (avatar == null ? Constants.DEFALT_AVATAR : avatar);
  }

  static getPartyId() {
    var partyId = StoreUtil.read(Constants.KEY_PARTY_ID);
    return partyId;
  }

  static getSecret() {
    var secret = StoreUtil.read(Constants.KEY_SECRET);
    return secret;
  }

  static getUserAvatar(String nickname, String? avatar) {
    if (avatar != null) {
      return CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(avatar),
      );
    } else {
      return CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey,
        child: Text(
          // show first letter if avatar is null
          nickname[0].toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
