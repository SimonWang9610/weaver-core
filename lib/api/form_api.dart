import '../utils/utils.dart';
import '../models/res_body.dart';
import '../models/form/form_model.dart';
import '../utils/http_util.dart';
import 'base_service.dart';

class FormApi extends BaseService {
  static Future<FormModel> getFormModel(String id) async {
    final ResBody resBody = await HttpUtil.get('/v1/wapp/forms/' + id);

    if (resBody.success!) {
      FormModel fm = FormModel.fromMap(resBody.data);
      return fm;
    }

    return FormModel(id: 'unknown', groups: const []);
  }
}
