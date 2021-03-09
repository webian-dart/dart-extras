import 'package:dart_extras/src/object_scope_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Object Scope Extensions Should", () {
    test("run the callback with itself as the value", () {
      String? word;
      final expected = "hello"..and((w) => word = w);
      expect(word!, expected);
    });
  });
}
