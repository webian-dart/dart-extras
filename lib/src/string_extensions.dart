extension StringExtensions on String {
  bool get isNullOrEmpty => this == '' || this == null;
  bool get isNotNullOrEmpty => !this.isNotNullOrEmpty;
  static bool isUsable(String value) => value != null && value.isNotEmpty;
}
