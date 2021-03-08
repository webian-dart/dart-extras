import 'task_result.dart';

class Result implements TaskResult {
  final bool wasSuccessful;
  final String error;
  final bool isEmpty;
  final bool isPending;

  bool get isNotEmpty => !isEmpty;

  bool get isNotPending => !isPending;

  Result.success()
      : this.wasSuccessful = true,
        this.error = "",
        this.isEmpty = false,
        this.isPending = false;

  Result.failure()
      : this.wasSuccessful = false,
        this.error = "",
        this.isEmpty = false,
        this.isPending = false;

  Result.error(String error)
      : this.wasSuccessful = false,
        this.error = error,
        this.isEmpty = false,
        this.isPending = false;

  Result.empty({bool isPending = false})
      : this.wasSuccessful = false,
        this.error = "",
        this.isEmpty = true,
        this.isPending = isPending;

  Result.clone(Result other)
      : this.wasSuccessful = other.wasSuccessful,
        this.error = other.error,
        this.isEmpty = other.isEmpty,
        this.isPending = other.isPending;
}
