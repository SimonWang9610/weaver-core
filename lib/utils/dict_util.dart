import 'package:weaver_core/base/vo/select_option_vo.dart';
import 'package:weaver_core/models/province.dart';
import 'constants.dart';
import 'store_util.dart';
import 'contact_util.dart';

class DictUtil {
  static final male = SelectOptionVO(value: 'M', label: 'Male');
  static final female = SelectOptionVO(value: 'F', label: 'Female');
  static final genderList = <SelectOptionVO>[male, female];

  static List getDictItemList(String dictCode) {
    var data = StoreUtil.read(Constants.KEY_DICT_ITEM_LIST);
    if (data == null) {
      return [];
    }
    var map = Map.from(data);
    return map[dictCode] ?? [];
  }

  static List<SelectOptionVO> getOptionList(String dictCode) {
    if (dictCode == Constants.CODE_CONTACTS) {
      return getContactOptionList();
    }
    return getDictItemList(dictCode)
        .map((e) => SelectOptionVO(value: e['id'], label: e['name']))
        .toList();
  }

  static List<SelectOptionVO> getGenderOptionList() {
    return genderList;
  }

  static List<SelectOptionVO> getProvinceOptionList(List<Province> provinces) {
    final list = <SelectOptionVO>[];

    for (var province in provinces) {
      list.add(SelectOptionVO(value: province.id, label: province.name));
    }

    return list;
  }

  static List<SelectOptionVO> getContactOptionList() {
    var contacts = ContactUtil.getContacts();
    return contacts
        .map((e) => SelectOptionVO(value: e.id, label: e.nickname))
        .toList();

    // The following also works
    /*var data = StoreUtil.read(Constants.CODE_CONTACTS);
    if (data == null) {
      return [];
    }
    var json = jsonDecode(data);
    var list = List.from(json);
    return list.map((e) => SelectOptionVO(value: e['id'], label: e['nickname'])).toList();*/
  }
}
