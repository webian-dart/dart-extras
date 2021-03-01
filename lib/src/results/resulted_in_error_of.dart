import './result_of.dart';

class ResultedInErrorOf<T> extends ResultOf<T> {
  ResultedInErrorOf({String error}) : super.error(error);
}
