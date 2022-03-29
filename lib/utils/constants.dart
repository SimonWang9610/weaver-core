class Constants {
  // DEV OR PROD MODE - release mode
  static const bool isProd = bool.fromEnvironment('dart.vm.product');

  // DEV OR PROD MODE - debug mode
  static const bool isDev = !bool.fromEnvironment('dart.vm.product');

  // this is base URI for non-web browser (for browser it is relative path)
  //static final String prodBaseUri = 'https://qa.goweaver.one';
  //static final String prodBaseUri = 'https://dev.goweaver.one';
  static const String prodBaseUri =
      enableHttps ? 'https://' : 'http://' + prodUri;
  static const String prodPusherUri = 'ws://' + prodUri + '/pusher';

  // START: DEV related
  // base URI when on isDev == true
  static final bool useDevHeaders = true;
  //static final String devBaseUri = 'https://qa.goweaver.one';
  //static final String devBaseUri = 'https://dev.goweaver.one';
  static const String devBaseUri =
      enableHttps ? 'https://' : 'http://' + devUri;
  static const String devPusherUri = 'ws://' + devUri + '/pusher';
  // END: DEV related

  static const bool enableHttps =
      bool.fromEnvironment('https', defaultValue: false);

  static const String devUri =
      String.fromEnvironment('dev', defaultValue: '192.168.2.136:9123');

  static const String prodUri =
      String.fromEnvironment('prod', defaultValue: '192.168.2.136:9123');

  static const String DEFALT_AVATAR = "https://ajaxweaver.com/assets/bird.jpg";

  static const String KEY_MENU_LIST = "menuList";
  static const String KEY_USERID = "userid";
  static const String KEY_EMAIL = "email";
  static const String KEY_NICKNAME = "nickname";
  static const String KEY_TOKEN = "token";
  static const String KEY_AVATAR = "avatar";
  static const String KEY_LOCALE = "locale";
  static const String KEY_LANGUAGE = "language";
  static const String KEY_PARTY_ID = "partyId";
  static const String KEY_SECRET = "secret";
  static const String KEY_DICT_ITEM_LIST = "dictItemList";

  static const String CODE_GENDERS = "genders";
  static const String CODE_PROVINCES = "provinces";
  static const String CODE_COUNTRIES = "countries";
  static const String CODE_ROLES = "roles";
  static const String CODE_ACTIONS = "actions";

  static const String CODE_CONTACTS = "contacts";

  static const int TOTP_DURATION = 30;
  // it should be base32, RFC4648
  static const int QR_TOTP_LENGTH = 6;

  // Topics supported by the Communicator
  static const String TOPIC_HANDSHAKE = "handshake";
  static const String TOPIC_HEARTBEAT = "heartbeat";
  static const String TOPIC_NOTIF = "notif";
  static const String TOPIC_UDR = "udr";
  static const String TOPIC_CONTACT = "contact";
  static const String TOPIC_CHAT = "chat";
  static const String TOPIC_MOMENT = "moment";
  static const String TOPIC_PAYMENT = "payment";

  // Actions supported by the Communicator
  static const String ACTION_LOGIN = "login";
  static const String ACTION_KEEPALIVE = "keepalive";
  static const String ACTION_UDR = "udr";
}
