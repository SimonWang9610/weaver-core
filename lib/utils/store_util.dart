import 'package:get_storage/get_storage.dart';

import '../models/res_body.dart';
import '../models/menu.dart';
import '../api/dict_api.dart';
import '../api/menu_api.dart';
import 'constants.dart';

class StoreUtil {
  static init() async {
    await GetStorage.init();
  }

  static read(String key) {
    return GetStorage().read(key);
  }

  static remove(String key) {
    return GetStorage().remove(key);
  }

  static write(String key, value) {
    GetStorage().write(key, value);
  }

  static hasData(String key) {
    return GetStorage().hasData(key);
  }

  static cleanAll() {
    GetStorage().erase();
  }

  static List<Menu> getMenuList() {
    var data = GetStorage().read(Constants.KEY_MENU_LIST);
    return data == null ? [] : List.from(data).map((e) => Menu.fromMap(e)).toList();
  }

  static Future<bool?> loadMenuData(String url) async {
    ResBody resBody = await MenuApi.list(url);

    if (resBody.success!) {
      StoreUtil.write(Constants.KEY_MENU_LIST, resBody.data);
    }

    return resBody.success;
  }

  static Future<bool?> loadDict(String url) async {
    ResBody resBody = await DictApi.map(url);

    if (resBody.success!) {
      StoreUtil.write(Constants.KEY_DICT_ITEM_LIST, resBody.data);
    }

    return resBody.success;
  }
}
