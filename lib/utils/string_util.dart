// See https://github.com/Ephenodrom/Dart-Basic-Utils

///
/// Helper class for String operations
///
class StringUtil {
  ///
  /// Checks if the given String [s] is null or empty
  ///
  static bool isNullOrEmpty(String? s) =>
    (s == null || s.isEmpty) ? true : false;

  ///
  /// Checks if the given String [s] is not null or empty
  ///
  static bool isNotNullOrEmpty(String? s) => !isNullOrEmpty(s);

  ///
  /// Capitalizes the first character of the given string [s].
  ///
  static capitalize(String? s) {
    if (s != null && !s.isEmpty) {
      return s[0].toUpperCase() + s.substring(1);
    }
    return '';
  }
}
