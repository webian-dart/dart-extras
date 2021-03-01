import 'package:dart_extras/dart_extras.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Result of should", () {
    test("return a success result", () {
      final result = ResultOf.succeededWithoutValue();
      expect(result.wasSuccessful, true);
    });
    test("return a success result", () {
      final result = ResultOf.success("success");
      expect(result.wasSuccessful, true);
      expect(result.failed, false);
      expect(result.value, "success");
    });
    test("return a failure result", () {
      final result = ResultOf.failure();
      expect(result.wasSuccessful, false);
      expect(result.failed, true);
      expect(result.error, "");
    });
    test(
        "throws the default error for trying to create a success with a invalid value",
        () {
      expect(() => ResultOf.success(null),
          throwsA(ResultOf.successDoesNotTakeNullError));
    });
    test(
        "throws the default error for trying to create a error with value with not value",
        () {
      expect(() => ResultOf.errorWithValue(null),
          throwsA(ResultOf.defaultedFailureError));
    });
    test("failed with some payload", () {
      final result = ResultOf.errorWithValue("some error payload");
      expect(result.wasSuccessful, false);
      expect(result.failed, true);
      expect(result.value, "some error payload");
    });

    test("tell us if it has value or not", () {
      final failure = ResultOf.errorWithValue("some error payload");
      final success = ResultOf.succeededWithoutValue();
      expect(failure.doesNotHaveValue(), false);
      expect(failure.hasValue(), true);
      expect(success.doesNotHaveValue(), true);
      expect(success.hasValue(), false);
    });
    test("return a failure result", () {
      final failure = ResultOf.error("some error");
      expect(failure.value, null);
      expect(failure.errorMessage(), "some error");
    });
    test("return an empty result", () {
      final result = ResultOf.empty(isPending: true);
      expect(result.result.isPending, true);
      expect(result.result.isEmpty, true);
    });
    test("return clone of result", () {
      ResultOf<bool> errorResult = ResultOf.error("some error");
      final clone = ResultOf.clone(errorResult);
      expect(clone, isNot(errorResult));
      expect(clone.error, "some error");
      expect(clone.wasSuccessful, false);
    });
  });
}
