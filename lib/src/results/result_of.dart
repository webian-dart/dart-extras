import './result.dart';
import './success.dart';
import './task_result.dart';

class ResultOf<T> extends TaskResult {
  static final defaultedFailureError =
      Exception("ResultOf created with a defaulted Failure cannot be "
          "instantiated with a null value. Use ResulfOf.failure() instead, if "
          "this was intentinal");

  static final successDoesNotTakeNullError =
      Exception("ResultOf.success(value) cannot be created with null! "
          "If you want to indicate Nullity user the Null Pattern.");

  final T? value;
  final Result result;

  bool get wasSuccessful => result.wasSuccessful;

  bool get failed => !wasSuccessful;

  @override
  String get error => errorMessage();

  ResultOf.succeededWithoutValue()
      : this.value = null,
        this.result = Success();

  ResultOf.empty({bool isPending = false})
      : this.value = null,
        this.result = Result.empty(isPending: isPending);

  ResultOf.success(this.value) : this.result = _buildResult(value);

  ResultOf.failure()
      : this.value = null,
        this.result = Result.failure();

  ResultOf.errorWithValue(T value)
      : this.value = value == null ? throw defaultedFailureError : value,
        this.result = Result.failure();

  ResultOf.error(String message)
      : this.value = null,
        this.result = Result.error(message);

  ResultOf.clone(ResultOf<T> other)
      : this.value = other.value,
        this.result = Result.clone(other.result);

  String errorMessage() => this.result.error;

  bool hasValue() => value != null;

  bool doesNotHaveValue() => !hasValue();

  static _buildResult<T>(T value) {
    if (value == null) {
      return throw successDoesNotTakeNullError;
    } else {
      return Result.success();
    }
  }
}
