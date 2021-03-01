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
