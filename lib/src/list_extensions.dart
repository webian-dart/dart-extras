extension on Iterable<List<String>> {
  List<String> flatMap() {
    return this.expand((e) => e).toList();
  }
}

extension on List<String> {
  List<String> removeDuplicates() {
    return this.toSet().toList();
  }
}

extension ListExtensions<T extends List> on T? {
  List<T> noNulls<T>() => this?.whereType<T>().where((it) => it != null).toList() ?? <T>[];
}

