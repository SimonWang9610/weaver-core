import 'package:timeago/timeago.dart' as ta;
import 'common_util.dart';

class TimeUtil {
  static timeago(now, s) {
    final locale = CommonUtil.isLocalEn() ? 'en' : 'zh_CN';
    final dt = DateTime.parse(s);
    final difference = now.difference(dt);
    return ta.format(now.subtract(difference), locale: locale);
  }
}
