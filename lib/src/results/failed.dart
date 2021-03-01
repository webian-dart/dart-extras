import './result_of.dart';

import 'nothing.dart';

class Failed extends ResultOf<Nothing> {
  Failed() : super.failure();
}
