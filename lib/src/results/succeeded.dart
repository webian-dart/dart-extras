import './result_of.dart';

import 'nothing.dart';

class Succeeded extends ResultOf<Nothing> {
  Succeeded() : super.succeededWithoutValue();
}
