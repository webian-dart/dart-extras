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
      final failure = ResultOf.error("some error payload");
      expect(failure.doesNotHaveValue(), true,
          reason: "Error with a Value should have a value");
      expect(failure.hasValue(), false,
          reason: "Error with a Value should have a value");
      expect(failure.isSuccessWithValue(), false,
          reason: 'Error with value, is Success Value');

      final failureWithValue = ResultOf.errorWithValue(Object());
      expect(failureWithValue.doesNotHaveValue(), false,
          reason: "Error with a Value should have a value");
      expect(failureWithValue.hasValue(), true,
          reason: "Error with a Value should have a value");
      expect(failureWithValue.isSuccessWithValue(), false,
          reason: 'Error with value, is Success Value');

      final success = ResultOf.succeededWithoutValue();
      expect(success.doesNotHaveValue(), true);
      expect(success.hasValue(), false);
      expect(success.isSuccessWithValue(), false);

      final successWithValue = ResultOf.success("");
      expect(successWithValue.doesNotHaveValue(), false);
      expect(successWithValue.hasValue(), true);
      expect(successWithValue.isSuccessWithValue(), true);
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
