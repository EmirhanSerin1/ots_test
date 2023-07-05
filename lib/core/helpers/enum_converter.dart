class EnumConverter {
  static String encodeEnum(dynamic input) => input.toString().split('.').last;

  static T decodeEnum<T>(Iterable<T> values, String? value) {
    return values.firstWhere(
      (type) => type.toString().split(".").last == (value ?? ""),
      orElse: () => values.first,
    );
  }
}