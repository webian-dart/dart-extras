import 'package:dart_extras/src/nullable_object_scope_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Nullable Object Scope Extensions Should", () {
    test("call the function with itself on 'apply' and return itself", () {
      var self = "";
      var hello = "Hello".apply((it) {
        self = it;
      });
      expect(hello, "Hello");
      expect(self, hello);
    });

    test("call the function with itself on 'let' and return a result", () {
      var itself = "";
      var result = "Itself".let((it) {
        itself = it;
        return 1;
      });
      expect(result, 1);
      expect(itself, "Itself");
    });

    test("run the provided callback", () {
      var called = false;
      "itself".run(() {
        called = true;
      });
      expect(called, true);
    });

    test("run the provided callback when not null", () {
      var called = false;
      "".runNotNull(() {
        called = true;
      });
      expect(called, true);
    });

    test("not run the provided callback when null", () {
      var called = false;
      Object? nullable;
      nullable.runNotNull(() {
        called = true;
      });
      expect(called, false);
    });

    test("run left when null", () {
      var rightCalled = false;
      var leftCalled = false;
      Object? nullable;
      nullable.either((it) => rightCalled = true, () => leftCalled = true);
      expect(rightCalled, false, reason: "right");
      expect(leftCalled, true, reason: "left");
    });

    test("run right when not null", () {
      var rightCalled = false;
      var leftCalled = false;
      "not null".either((it) => rightCalled = true, () => leftCalled = true);
      expect(rightCalled, true, reason: "right");
      expect(leftCalled, false, reason: "left");
    });

    test(
        "get a value from either the first function when not null or the other when so",
        () {
      final Object? nill = null;
      final resultFromNull =
          nill.fromEither((it) => "should not reach here", () => "correct");
      expect(resultFromNull, "correct", reason: "Did not reach Or");
      final Object? notNill = Object();
      final resultFromNotNill = notNill.fromEither(
          (it) => "Is not Null", () => "Wrong should have run the other");
      expect(resultFromNotNill, "Is not Null",
          reason: "Should have returned the result of the first function");
    });
  });
}
