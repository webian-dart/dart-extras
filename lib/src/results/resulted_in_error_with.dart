import './result_of.dart';

class ResultedInErrorWith<T> extends ResultOf<T> {
  ResultedInErrorWith(T value) : super.errorWithValue(value);
}
