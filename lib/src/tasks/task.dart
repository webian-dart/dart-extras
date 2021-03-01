import '../../dart_extras.dart';

abstract class Task<T extends TaskResult> {
  T execute();
}
