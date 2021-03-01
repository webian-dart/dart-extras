import './result_of.dart';

class SuccessOf<T> extends ResultOf<T> {
  SuccessOf(T value) : super.success(value);
}
