import '../utils/utils.dart';
import '../models/res_body.dart';
import '../utils/http_util.dart';
import 'base_service.dart';

class MenuApi extends BaseService {
  static Future<ResBody> list(String url) async {
    ResBody resBody = await HttpUtil.get(url);
    return resBody;
  }
}
