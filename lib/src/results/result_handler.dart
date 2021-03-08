import './result_of.dart';

typedef OnSuccess<T>(ResultOf<T> result);
typedef OnError<T>(ResultOf<T> result);

class ResultHandler<T> {
  final OnSuccess? _onSuccess;
  final OnError? _onError;

  ResultHandler({OnSuccess? onSuccess, OnError? onError})
      : this._onSuccess = onSuccess,
        this._onError = onError;

  void ok(ResultOf<T> result) => _onSuccess?.call(result);
  void fail(ResultOf<T> result) => _onError?.call(result);
}
